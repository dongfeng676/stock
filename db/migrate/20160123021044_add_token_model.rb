class AddTokenModel < ActiveRecord::Migration
  def change
    add_column :products,:unique_id,:string,:default=>SecureRandom.urlsafe_base64
    add_column :addresses,:unique_id,:string,:default=>SecureRandom.urlsafe_base64
    add_column :adverts,:unique_id,:string,:default=>SecureRandom.urlsafe_base64
    add_column :categories,:unique_id,:string,:default=>SecureRandom.urlsafe_base64
    add_column :detail_categories,:unique_id,:string,:default=>SecureRandom.urlsafe_base64
    add_column :hot_categories,:unique_id,:string,:default=>SecureRandom.urlsafe_base64
    add_column :orders,:unique_id,:string,:default=>SecureRandom.urlsafe_base64
    add_column :sub_categories,:unique_id,:string,:default=>SecureRandom.urlsafe_base64
    add_column :users,:unique_id,:string,:default=>SecureRandom.urlsafe_base64

    add_index :products,:unique_id
    add_index :addresses,:unique_id
    add_index :adverts,:unique_id
    add_index :categories,:unique_id
    add_index :detail_categories,:unique_id
    add_index :hot_categories,:unique_id
    add_index :orders,:unique_id
    add_index :sub_categories,:unique_id
    add_index :users,:unique_id
  end
end
