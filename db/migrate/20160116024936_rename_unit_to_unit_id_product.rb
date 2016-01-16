class RenameUnitToUnitIdProduct < ActiveRecord::Migration
  def change
    rename_column :products,:unit,:unit_id
    add_index :products, :unit_id
  end
end
