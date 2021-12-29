class CreateClockIns < ActiveRecord::Migration[6.0]
  def change
    create_table :clock_ins do |t|
      t.datetime :clock_in_time, null: false, comment: '勤務開始時刻'
      t.string :clock_in_date, null: false, comment: '勤務開始時刻の日付'

      t.timestamps
    end
  end
end
