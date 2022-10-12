# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  belongs_to :user
  has_many :items, through: :cart_items, source: :item

  def num_items
   quantity =  self.cart_items.pluck(:quantity)
   return quantity.sum
  end
  
end
