class AddEmployeeIdToAttendance < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :employee_id, :integer
  end
end
