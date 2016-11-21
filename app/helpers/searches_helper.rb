module SearchesHelper
  def is_available? (booking_count)
    booking_count == nil ? :Availabe : "Booked" + "(" + booking_count + ")"
  end
end
