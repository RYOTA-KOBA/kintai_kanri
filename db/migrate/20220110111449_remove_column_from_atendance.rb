class RemoveColumnFromAtendance < ActiveRecord::Migration[6.0]
  def change
    remove_column :attendances, :rest_id, :integer
    remove_column :attendances, :clock_in_id, :integer
    remove_column :attendances, :clock_out_id, :integer
    remove_column :attendances, :rest_in_id, :integer
    remove_column :attendances, :rest_out_id, :integer
  end
end
