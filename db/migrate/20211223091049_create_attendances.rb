class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.datetime :clock_in, null: false, comment: '出勤時刻'
      t.datetime :clock_out, null: false, comment: '退勤時刻'
      t.string :rest_time, null: false, comment: '休憩時間の合計'
      t.integer :rest_id, null: false, comment: '休憩時間ID'

      t.timestamps
    end
  end
end
