class CreateCollectionCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :collection_categories do |t|
      t.references :collections, foreign_key: true
      t.references :categories, foreign_key: true
      t.timestamps
    end
  end
end
