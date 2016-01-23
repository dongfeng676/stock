class AddColumn < ActiveRecord::Migration
  def change
    add_column :products,:unique_id,:string
    add_column :addresses,:unique_id,:string
    add_column :adverts,:unique_id,:string
    add_column :categories,:unique_id,:string
    add_column :detail_categories,:unique_id,:string
    add_column :hot_categories,:unique_id,:string
    add_column :orders,:unique_id,:string
    add_column :sub_categories,:unique_id,:string
    add_column :users,:unique_id,:string
  end
end
