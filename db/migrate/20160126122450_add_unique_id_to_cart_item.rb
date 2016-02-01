class AddUniqueIdToCartItem < ActiveRecord::Migration
  def change
    add_column :cart_items,:unique_id,:string
    add_index :cart_items,:unique_id,unique:true
  end
end
