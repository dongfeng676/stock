class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.string :target_type
      t.integer :target_id

      t.timestamps null: false
    end
  end
end
