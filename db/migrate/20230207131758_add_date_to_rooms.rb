class AddDateToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :start_date, :date
    add_column :rooms, :end_date, :date
  end
end
