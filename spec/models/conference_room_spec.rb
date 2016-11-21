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

require 'rails_helper'

RSpec.describe ConferenceRoom, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
