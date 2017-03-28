class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :reservations, :seat_number, :string
  end
end
