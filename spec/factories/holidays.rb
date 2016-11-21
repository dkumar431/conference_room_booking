# == Schema Information
#
# Table name: holidays
#
#  id         :integer          not null, primary key
#  date       :date
#  reason     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :holiday do
    date "2016-11-17"
    reason "MyString"
  end
end
