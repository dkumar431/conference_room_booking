class HolidaysController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @holidays = Holiday.all
  end
  
  def new
    @holiday = Holiday.new 
  end
  
  def create
    Holiday.create(holiday_params)
    redirect_to holidays_path
  end

  private
  def holiday_params
    params.require(:holiday).permit(:date, :reason)
  end

end
