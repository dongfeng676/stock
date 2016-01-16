class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :province
      t.string :city
      t.string :region
      t.string :detail
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
