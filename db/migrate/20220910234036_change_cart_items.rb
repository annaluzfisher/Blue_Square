class ChangeCartItems < ActiveRecord::Migration[7.0]
  def change
    add_column :cart_items, :quantity, :integer, null: false
    add_column :cart_items, :size, :string
    add_index :cart_items, [:size, :item_id], unique: true
    remove_column :cart_items, :user_id
    add_reference :cart_items, :cart, foreign_key: true
  end
end
