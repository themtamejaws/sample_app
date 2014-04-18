class AddBookingModel < ActiveRecord::Migration
  def change
    create_table :bookings do |b|
      b.date :day, null: false
      b.integer :time, null: false
      b.integer :user_id, null: false
    end

    add_index :bookings, [:day, :time], unique: true
  end
end
