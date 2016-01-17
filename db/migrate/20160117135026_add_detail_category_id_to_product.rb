class AddDetailCategoryIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :detail_category_id, :integer
    add_index :products,:detail_category_id
  end
end
