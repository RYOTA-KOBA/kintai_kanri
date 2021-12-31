class RemoveNullFalseFromAttendances < ActiveRecord::Migration[6.0]
  def change
    change_column_null :attendances, :rest_in_id, true
    change_column_null :attendances, :rest_out_id, true
  end
end
