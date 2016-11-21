# == Schema Information
#
# Table name: bookings
#
#  id                 :integer          not null, primary key
#  conference_room_id :integer
#  user_id            :integer
#  start_time         :datetime
#  end_time           :datetime
#  booking_status_id  :integer
#  priority           :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe Booking, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
