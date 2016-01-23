class AddDefaultToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :default, :integer,:default=>0
  end
end
