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

FactoryGirl.define do
  factory :booking do
    conference_room nil
    user nil
    start_time "2016-11-17 09:01:24"
    end_time "2016-11-17 09:01:24"
    booking_status nil
    priority 1
  end
end
