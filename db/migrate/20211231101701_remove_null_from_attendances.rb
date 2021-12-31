class RemoveNullFromAttendances < ActiveRecord::Migration[6.0]
  def change
    change_column_null :attendances, :clock_in_id, true
    change_column_null :attendances, :clock_out_id, true
    change_column_null :attendances, :employee_id, false
  end
end
