class ChangeColumnNameForConferenceRoom < ActiveRecord::Migration
  def change
    rename_column :conference_rooms, :type, :room_type
  end
end
