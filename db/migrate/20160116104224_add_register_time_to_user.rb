class AddRegisterTimeToUser < ActiveRecord::Migration
  def change
    add_column :users, :register_time, :datetime
  end
end
