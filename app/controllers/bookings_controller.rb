class BookingsController < ApplicationController

  def create
    Booking.create_booking(booking_params)
    redirect_to my_bookings_bookings_path
  end
  def my_bookings 
    @bookings = Booking.get_my_bookings
  end
  def destroy
    booking = Booking.where(id: params[:id]).first
    booking.cancel_booking
    redirect_to my_bookings_bookings_path
  end

  private
  def booking_params
    params.require(:booking).permit(:date, :start_time, :end_time, :conference_room_id, :user_id)
  end
end
