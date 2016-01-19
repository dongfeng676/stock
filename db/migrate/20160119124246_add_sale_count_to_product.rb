class AddSaleCountToProduct < ActiveRecord::Migration
  def change
    add_column :products, :sale_count, :integer,:default=>0
  end
end
