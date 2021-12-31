class AddClockInIdToAttendance < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :clock_in_id, :integer, null: false
    add_column :attendances, :clock_out_id, :integer, null: false
    add_column :attendances, :rest_in_id, :integer
    add_column :attendances, :rest_out_id, :integer
  end
end
