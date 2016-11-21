# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ConferenceRoom.create(name: :Mercury, room_type: :Audio, size: 4, bridge_no: 'x65858 77129')
# ConferenceRoom.create(name: :Venus, room_type: :Video, size: 10, bridge_no: 'x65858 77120')
# ConferenceRoom.create(name: :Mars, room_type: :Audio, size: 7, bridge_no: 'x65858 77206')
# ConferenceRoom.create(name: :Saturn, room_type: :Audio, size: 5, bridge_no: 'x65858 77111')
# ConferenceRoom.create(name: :Neptune, room_type: :Video, size: 5, bridge_no: 'x65858 77139')

BookingStatus.create(status: "Confirmed")
BookingStatus.create(status: "Cancelled")
BookingStatus.create(status: "Waiting")
BookingStatus.create(status: "Inactive")
