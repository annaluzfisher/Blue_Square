class AddImageUrlColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :image_url, :string
    add_column :collections, :image_url, :string
    add_column :items, :image_url, :string
  end
end
