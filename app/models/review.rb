class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item
  validates :rating, inclusion: { in: 1..5 }
  validates :title, presence: true
  validates :content, length: { in: 20...300 }
end
