
json.items do
  @cart.cart_items.each do |cart_item|
    json.set! cart_item.id do
      json.extract! cart_item.item, :id, :price, :name,  :image_url
      json.extract! cart_item, :quantity, :size
      json.cart_item_id cart_item.id
    end
  end
end

json.num_items do
   json.num_items @cart.num_items
end

json.id @cart.id
