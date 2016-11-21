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

FactoryGirl.define do
  factory :conference_room do
    name "MyString"
    type ""
    size 1
    bridge_no "MyString"
  end
end
