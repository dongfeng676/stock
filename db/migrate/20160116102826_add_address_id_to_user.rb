class AddAddressIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :address_id, :integer
    # add_reference :users, :address, index: true, foreign_key: true
    add_index :users,:address_id
  end
end
