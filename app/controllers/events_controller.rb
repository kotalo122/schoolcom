class EventsController < ApplicationController
  before_action :set_room, only: [:index, :create]
  
  def index
    @event = Event.new
    @events = @room.events.includes(:user)
  end

  def create
    @event = @room.events.new(event_params)
    if @event.save
      redirect_to room_events_path(@room)
    else
      @events = @room.events.includes(:user)
      render :index
    end
  end

  

  private

  def event_params
    params.require(:event).permit(:event_day, :title, :content, :grade_id).merge(user_id: current_user.id)
  end

  def set_room
    @rooms = Room.all
    @room = Room.find(params[:room_id])
  end

end