class EventsController < ApplicationController
  before_action :set_room, only: [:index, :create, :edit, :update, :show, :destroy]
  before_action :set_beginning_of_week
  
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

  def edit
    @event = Event.find(params[:id])
  end
 
  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to room_events_path
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to room_events_path
  end

  def show
    @event = Event.find(params[:id])
    @comments = @event.comments.includes(:user)
    @comment = Comment.new
  end


  private

  def event_params
    params.require(:event).permit(:event_day, :title, :content, :grade_id, :image).merge(user_id: current_user.id)
  end

  def set_room
    @rooms = Room.all
    @room = Room.find(params[:room_id])
  end

  def set_beginning_of_week
    Date.beginning_of_week = :sunday
  end

end