class AddShiftDateToShifts < ActiveRecord::Migration[5.2]
  def change
    add_column :shifts, :shift_date, :date
  end
end
