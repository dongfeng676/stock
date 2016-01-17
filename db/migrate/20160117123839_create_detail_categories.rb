class CreateDetailCategories < ActiveRecord::Migration
  def change
    create_table :detail_categories do |t|
      t.string :name
      t.references :sub_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
