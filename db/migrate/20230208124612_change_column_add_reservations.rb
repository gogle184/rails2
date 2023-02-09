class ChangeColumnAddReservations < ActiveRecord::Migration[6.1]
  def change
    def change
      change_column :reservations, :date, :start_date, defalut:"", null: false
      change_column :reservations, :date, :end_date, defalut:"",null: false
    end
  end
end
