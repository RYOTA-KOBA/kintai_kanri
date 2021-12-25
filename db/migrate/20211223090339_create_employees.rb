class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name, null: false, comment: '従業員名'
      t.integer :store_id, null: false, comment: '所属する店舗ID'

      t.timestamps
    end
  end
end
