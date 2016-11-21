# == Schema Information
#
# Table name: conference_rooms
#
#  id         :integer          not null, primary key
#  name       :string
#  type       :string
#  size       :integer
#  bridge_no  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ConferenceRoom < ActiveRecord::Base
    ROOM_TYPES = [:Audio, :Video]
    has_many :bookings
end
