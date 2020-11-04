class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy, :update]
  before_action :set_event, only: [:edit, :show, :update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    event = Event.find(params[:id])
    if event.destroy
      redirect_to root_path
    end
  end

  def edit
    if current_user.id != @event.user.id
      redirect_to root_path 
    end
  end

  def show
    @comment = Comment.new
    @comments = Comment.where(event_id: @event)
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:genre_id, :project, :overview, :date, :email, :phone, :address, images: []).merge(user_id: current_user.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end