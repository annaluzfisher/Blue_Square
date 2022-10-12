
  # debugger
  @items.each do |item| 
      json.set! item.id do
      json.extract! item, :id, :name, :image_url
    end
  end
