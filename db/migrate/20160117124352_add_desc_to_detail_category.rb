class AddDescToDetailCategory < ActiveRecord::Migration
  def change
    add_column :detail_categories, :desc, :string
  end
end
