class AddEmployeeIdToClockIn < ActiveRecord::Migration[6.0]
  def change
    add_column :clock_ins, :employee_id, :integer, null: false, comment: '従業員特定用id'
    add_column :clock_outs, :employee_id, :integer, null: false, comment: '従業員特定用id'
    add_column :rest_ins, :employee_id, :integer, null: false, comment: '従業員特定用id'
    add_column :rest_outs, :employee_id, :integer, null: false, comment: '従業員特定用id'
  end
end
