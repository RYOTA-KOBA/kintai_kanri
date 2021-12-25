class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores, comment: '店舗' do |t|
      t.string :name, null: false, comment: '店舗名'

      t.timestamps
    end
  end
end
