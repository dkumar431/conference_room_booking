# == Schema Information
#
# Table name: booking_statuses
#
#  id         :integer          not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BookingStatus < ActiveRecord::Base
    has_many :bookings
end
