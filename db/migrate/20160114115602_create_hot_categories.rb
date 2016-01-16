class CreateHotCategories < ActiveRecord::Migration
  def change
    create_table :hot_categories do |t|
      t.string :name
      t.string :desc

      t.timestamps null: false
    end
  end
end
