class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:create ]
  before_action :set_comment, only: [:create]

  def new
    @comments = Comment.new
  end
  
  def create
    @comment = @event.comments.new(comment_params)
    if @comment.save
      redirect_to event_path(@event)
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to event_path(@event)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :event_id).merge(user_id: current_user.id)
  end

  def set_comment
    @event = Event.find(params[:event_id])
  end
end


