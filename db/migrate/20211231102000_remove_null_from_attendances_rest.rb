class RemoveNullFromAttendancesRest < ActiveRecord::Migration[6.0]
  def change
    change_column_null :attendances, :working_time, true
    change_column_null :attendances, :rest_id, true
    change_column_null :attendances, :rest_time, true
  end
end
