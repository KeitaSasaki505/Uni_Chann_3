class EventsController < ApplicationController
  # impressionist :actions=> [:show, :index], :unique => [:impressionable_id, :ip_address]
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_event, only: [:edit, :show, :update]
  before_action :search_event, only: [:index, :search]

  def index
    @events = Event.all.page(params[:page]).per(15).order('updated_at DESC')
    set_event_column 
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to root_path, notice: "新しいイベントが投稿されました" 
    else
      render :new
    end
  end

  def destroy
    event = Event.find(params[:id])
    if event.destroy
      redirect_to root_path, alert: "イベントは削除されました"
    end
  end

  def edit
    if current_user.id != @event.user.id
      redirect_to root_path 
    end
  end

  def search
    @results = @p.result
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(event_id: @event)
    @like = Like.new
    impressionist(@event, nil, unique: [:impressionable_id, :ip_address])
    
    @views = @event.impressionist_count
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to root_path, notice: "イベント情報が更新されました" 
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:genre_id, :project, :overview, :date, :email, :phone, :address, images: []).merge(user_id: current_user.id)
    # active storage画像複数枚投稿
  end

  def set_event
    @event = Event.find(params[:id])
  end

  def search_event
    @p = Event.ransack(params[:q])
  end

  def set_event_column
    @event_name = Event.select("name").distinct  # 重複なくnameカラムのデータを取り出す
  end

end