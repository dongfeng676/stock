class AddOrderMoneyToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order_money, :float
  end
end
