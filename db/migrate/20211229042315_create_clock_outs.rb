class CreateClockOuts < ActiveRecord::Migration[6.0]
  def change
    create_table :clock_outs do |t|
      t.datetime :clock_out_time, null: false, comment: '勤務終了時刻'
      t.string :clock_out_date, null: false, comment: '勤務終了時刻の日付'

      t.timestamps
    end
  end
end
