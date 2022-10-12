
    json.set! @review.id do
      json.extract! @review, :id, :created_at, :title, :content, :user_id, :rating, :item_id
    end
