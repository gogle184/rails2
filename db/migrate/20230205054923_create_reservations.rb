class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.string :title
      t.string :about
      t.integer :price
      t.string :adress
      t.string :img
      t.date :start_date
      t.date :end_date
      t.integer :people
      t.integer :total_price
      t.integer :total_day
      t.integer :room_id
      t.integer :user_id

      t.timestamps
    end
  end
end
