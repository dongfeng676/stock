class CreateAdverts < ActiveRecord::Migration
  def change
    create_table :adverts do |t|
      t.string :ads_image
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
