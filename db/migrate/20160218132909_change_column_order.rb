class ChangeColumnOrder < ActiveRecord::Migration
  def change
    change_column :orders,:products,:text
  end
end
