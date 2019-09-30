class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.string :time
      t.string :date
      t.integer :num_of_guests
      t.integer :restaurant_id
      t.integer :user_id
      t.string :occasion

      t.timestamps
    end
  end
end
