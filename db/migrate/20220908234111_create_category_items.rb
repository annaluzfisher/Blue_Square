class CreateCategoryItems < ActiveRecord::Migration[7.0]
  def change
    create_table :category_items do |t|
      t.references :categories, foreign_key: true, null: false
      t.references :items, foreign_key: true, null: false
      t.timestamps
    end
  end
end
