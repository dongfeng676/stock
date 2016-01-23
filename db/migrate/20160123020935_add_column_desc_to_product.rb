class AddColumnDescToProduct < ActiveRecord::Migration
  def change
    add_column :products, :desc, :string
  end
end
