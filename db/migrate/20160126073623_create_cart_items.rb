class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :product_num
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
