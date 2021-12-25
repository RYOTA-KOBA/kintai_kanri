class CreateRests < ActiveRecord::Migration[6.0]
  def change
    create_table :rests do |t|
      t.datetime :rest_start, null: false, comment: '休憩開始'
      t.datetime :rest_end, null: false, comment: '休憩終了'
      t.integer :attendance_id, null: false, comment: '勤怠ID'

      t.timestamps
    end
  end
end
