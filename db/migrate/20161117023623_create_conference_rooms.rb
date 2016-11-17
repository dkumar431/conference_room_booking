class CreateConferenceRooms < ActiveRecord::Migration
  def change
    create_table :conference_rooms do |t|
      t.string :name
      t.string :type
      t.integer :size
      t.string :bridge_no

      t.timestamps null: false
    end
  end
end
