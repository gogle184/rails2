class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :img
      t.string :title
      t.text :about
      t.string :adress
      t.text :introduction
      t.string :price

      t.timestamps
    end
  end
end
