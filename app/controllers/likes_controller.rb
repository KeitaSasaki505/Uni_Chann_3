class LikesController < ApplicationController
#   def index
#     @events = Event.all.sort {|a,b| b.likes.count <=> a.likes.count}
#   end

#   def create
#     user = current_user.id
#     @event = Event.find(params[:event_id])
#     Like.create!(user_id: user, event_id: @event.id)
#   end

#   def destroy
#     @event = Event.find(params[:event_id])  
#     like= Like.find_by(user_id: current_user.id, event_id: @event.id )
#     like.delete
#   end
# end

  def create
    @like = current_user.likes.create(event_id: params[:event_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(event_id: params[:event_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end