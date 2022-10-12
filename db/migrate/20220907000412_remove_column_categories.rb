class RemoveColumnCategories < ActiveRecord::Migration[7.0]
  def change
    remove_column :categories, :collection_id
  end
end
