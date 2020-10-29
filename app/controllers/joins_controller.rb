class JoinsController < ApplicationController
  require 'csv'

  # before_action :authenticate_user!, only: [:new]
  before_action :set_join, only: [:index, :create, :show]
  
  def index
    @joins = Join.where(event_id: @event)
    respond_to do |format|
      format.html
      format.csv do |csv|
        send_posts_csv(@joins)
      end
    end
  end

  def new
    @join = Join.new
  end

  def create
    @join = @event.joins.new(join_params)
    if @join.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def update
  end

  def destroy
  end

  private

  def join_params
    params.require(:join).permit(:event_id, :name_kanji, :name_kana, :email, :phone, :message).merge(user_id: current_user.id)
  end

  def set_join
    @event = Event.find(params[:event_id])
  end

  def send_posts_csv(joins)
    csv_data = CSV.generate do |csv|
      column_names = %w(投稿日 名前 カナ メール 電話番号 コメント)
      csv << column_names
      joins.each do |join|
        column_values = [
          join.created_at,
          join.name_kanji,
          join.name_kana,
          join.email,
          join.phone,
          join.message,
        ]
        csv << column_values
      end
    end
    send_data(csv_data, filename: "参加者一覧.csv")
  end

end
