class AddSubCategoryIdToAdvert < ActiveRecord::Migration
  def change
    add_column :adverts, :sub_category_id, :integer
    add_index :adverts, :sub_category_id
  end
end
