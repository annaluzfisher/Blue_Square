class AddColumnToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :parent_id, :bigint
    add_foreign_key :categories, :categories, column: :parent_id
    
  end
end
