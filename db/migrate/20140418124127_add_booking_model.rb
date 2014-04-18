class AddBookingModel < ActiveRecord::Migration
  def change
    create_table :bookings do |b|
      b.date :day, null: false
      b.integer :time, null: false
      b.integer :user_id, null: false
      b.string :equipment, null: false
    end

    add_index :bookings, [:day, :time, :equipment], unique: true
  end
end
