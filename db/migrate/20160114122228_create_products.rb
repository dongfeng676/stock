class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :state
      t.string :image
      t.string :unit
      t.integer :stock_num
      t.float :price
      t.float :old_price
      t.references :sub_category, index: true, foreign_key: true
      t.references :hot_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
