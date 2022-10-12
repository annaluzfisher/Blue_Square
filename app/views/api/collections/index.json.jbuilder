json.categories do
  # debugger
  @collections.each do |col| 
    col.categories.each do |cat|
      json.set! cat.id do
      json.extract! cat, :id, :name, :parent_id, :image_url
      json.item_ids cat.item_ids
      end
    end
  end
end
json.collections do
      @collections.each do |col|
        json.set! col.id do
          json.extract! col, :id, :name, :image_url, :activity
          json.category_ids col.category_ids
                json.item_ids col.item_ids
        end
      end
end

#.includes

