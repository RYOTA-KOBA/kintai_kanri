class CreateRestOuts < ActiveRecord::Migration[6.0]
  def change
    create_table :rest_outs do |t|
      t.datetime :rest_out_time, null: false, comment: '休憩終了時刻'
      t.string :rest_out_date, null: false, comment: '休憩終了時刻の日付'

      t.timestamps
    end
  end
end
