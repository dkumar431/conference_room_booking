class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :conference_room, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.references :booking_status, index: true, foreign_key: true
      t.integer :priority

      t.timestamps null: false
    end
  end
end
