class Booking < ActiveRecord::Base
  belongs_to :conference_room
  belongs_to :user
  belongs_to :booking_status
end
