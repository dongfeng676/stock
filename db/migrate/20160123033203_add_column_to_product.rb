class AddColumnToProduct < ActiveRecord::Migration
  def change
    add_column :products,:spec,:string
    add_column :products,:unit_price,:string
    add_column :products,:origin,:string
    add_column :products,:remark,:string
  end
end
