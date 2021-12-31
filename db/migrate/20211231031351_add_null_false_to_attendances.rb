class AddNullFalseToAttendances < ActiveRecord::Migration[6.0]
  def change
    change_column_null :attendances, :clock_in_id, false
    change_column_null :attendances, :clock_out_id, false
    change_column_null :attendances, :rest_in_id, false
    change_column_null :attendances, :rest_out_id, false
  end
end
