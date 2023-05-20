class EventsController < ApplicationController
  def index
    @rooms = Room.all
  end
end
