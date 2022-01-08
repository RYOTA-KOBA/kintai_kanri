class CreateDakokus < ActiveRecord::Migration[6.0]
  def change
    create_table :dakokus do |t|
      t.integer :dakoku_type, null: false, default: 0, comment: '打刻の種類'
      t.integer :attendance_id, null: false, comment: '紐づく勤怠'
      t.integer :employee_id, null: false, comment: '紐づく従業員'
      t.datetime :dakoku_datetime, null: false, comment: '打刻した日時'

      t.timestamps
    end
  end
end
