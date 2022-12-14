# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  cart_id    :bigint
#  item_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :item
  end
