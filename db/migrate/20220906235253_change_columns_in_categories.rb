class ChangeColumnsInCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :activity
    add_column :collections, :activity, :boolean
    add_reference :categories, :collection, index: true
  end
end
