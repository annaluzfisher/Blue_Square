# == Schema Information
#
# Table name: collections
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  activity   :boolean          default(FALSE)
#  image_url  :string
#
class Collection < ApplicationRecord
  has_many :collection_categories, foreign_key: :collections_id, dependent: :destroy
  has_many :categories, through: :collection_categories, source: :category
  has_many :items, through: :categories, source: :items

  include PgSearch::Model
  # multisearchable against: :name
  pg_search_scope :search_item, against: [:name],  using: {
      :tsearch => { prefix: :true , dictionary: 'english'}
  }
  
end
