class CreateRestIns < ActiveRecord::Migration[6.0]
  def change
    create_table :rest_ins do |t|
      t.datetime :rest_in_time, null: false, comment: '休憩開始時刻'
      t.string :rest_in_date, null: false, comment: '休憩開時刻の日付'

      t.timestamps
    end
  end
end
