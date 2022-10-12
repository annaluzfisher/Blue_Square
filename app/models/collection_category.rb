# == Schema Information
#
# Table name: collection_categories
#
#  id             :bigint           not null, primary key
#  collections_id :bigint
#  categories_id  :bigint
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class CollectionCategory < ApplicationRecord
  belongs_to :category, foreign_key: :categories_id, class_name: :Category
  belongs_to :collection, foreign_key: :collections_id
end
