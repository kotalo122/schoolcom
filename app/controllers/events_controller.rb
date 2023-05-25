class EventsController < ApplicationController
  def index
    @rooms = Room.all
    @room = Room.find(params[:room_id])
    @event = Event.new
  end

  def create
    @rooms = Room.all
    @room = Room.find(params[:room_id])
    @event = @room.events.new(event_params)
    if @event.save
      redirect_to room_events_path(@room)
    else
      render :index
    end
  end

  

  private

  def event_params
    params.require(:event).permit(:event_day, :title, :content, :grade_id).merge(user_id: current_user.id)
  end

end