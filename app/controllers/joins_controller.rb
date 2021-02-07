class JoinsController < ApplicationController
  require 'csv'

  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :set_join, only: [:index, :new, :create]
  
  def index
    if current_user.id == @event.user.id
      @joins = Join.where(event_id: @event)
      respond_to do |format|
        format.html
        format.csv do |csv|
          send_posts_csv(@joins)
        end
      end
    else
      redirect_to root_path
    end
  end

  def new
    if (current_user.id == @event.user.id) || (@event.joins.find_by(user_id: current_user.id)) != nil
      redirect_to root_path
    else
      @join = Join.new
    end
  end

  def create
    @join = @event.joins.new(join_params)
    if @join.save
      redirect_to root_path, notice: "ご参加頂きありがとうございます！当日は楽しみましょう！"
    else
      flash[:alert] = "情報が正しく入力されませんでした"
      render :new
    end
  end

  private

  def join_params
    params.require(:join).permit(:event_id, :name_kanji, :name_kana, :email, :phone, :message).merge(user_id: current_user.id)
  end

  def set_join
    @event = Event.find(params[:event_id])
  end

  # CSVファイル出力
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
