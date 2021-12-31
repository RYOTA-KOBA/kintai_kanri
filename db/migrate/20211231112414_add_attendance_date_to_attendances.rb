class AddAttendanceDateToAttendances < ActiveRecord::Migration[6.0]
  def change
    add_column :attendances, :attendance_date, :string, null: false, comment: '打刻日時'
  end
end
