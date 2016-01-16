class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :state
      t.string :phone_num
      t.string :receive_name
      t.datetime :delivery_time
      t.datetime :complete_time
      t.string :products
      t.references :address, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
