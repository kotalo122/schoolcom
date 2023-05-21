class EventsController < ApplicationController
  def index
    @rooms = Room.all

    if params[:room_id].present?
      @room = Room.find(params[:room_id])
    else
      @room = Room.first
    end

    @event = Event.new
  end
end