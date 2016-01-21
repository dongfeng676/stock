class AddColumnToAddress < ActiveRecord::Migration
  def change
    add_column :addresses,:area,:string
    add_column :addresses,:receive_name,:string
    add_column :addresses,:receive_phone,:string
  end
end
