class ConferenceRoom < ActiveRecord::Base
    has_many :bookings
end
