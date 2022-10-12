# == Schema Information
#
# Table name: category_items
#
#  id            :bigint           not null, primary key
#  categories_id :bigint           not null
#  items_id      :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class CategoryItem < ApplicationRecord
  belongs_to :category, foreign_key: :categories_id, class_name: :Category
  belongs_to :item, foreign_key: :items_id
end
