class RemoveIndexOnSizeandItemId < ActiveRecord::Migration[7.0]
  def change
    remove_index :cart_items, [:size, :item_id]
  end
end
