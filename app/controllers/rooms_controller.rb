class RoomsController < ApplicationController
  before_action :move_to_index, only: [:new]
  before_action :move_to_index, only: [:create, :destroy]

  def index
    @rooms = Room.all
  end
  
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to root_path
  end


  private

  def room_params
    params.require(:room).permit(:name, :grade_id, user_ids: [])
  end

  def move_to_index
    unless current_user.position_id == 3
      redirect_to action: :index
    end
  end

end