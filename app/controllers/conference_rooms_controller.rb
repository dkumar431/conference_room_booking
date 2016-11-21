class ConferenceRoomsController < ApplicationController
  
  load_and_authorize_resource

  before_action :authenticate_user!

  def index
    @rooms = ConferenceRoom.all
  end

  def new 
    @room = ConferenceRoom.new
    authorize! :show, @project
  end

  def create
    ConferenceRoom.create(room_params)
    redirect_to conference_rooms_path
  end

  private
  def room_params
    params.require(:conference_room).permit(:name, :room_type, :size, :bridge_no)
  end

end
