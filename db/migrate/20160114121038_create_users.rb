class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :user_name
      t.string :head_portrait
      t.integer :identification, :default=>0
      t.string :password
      t.string :token
      t.string :phone_num
      t.string :rand, :rand=>"铜"

      t.timestamps null: false
    end
  end
end
