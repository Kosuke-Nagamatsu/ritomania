class Island < ApplicationRecord
  has_many :post_islands, dependent: :destroy
  has_many :posts, through: :post_islands, source: :post
  has_many :island_favorites, dependent: :destroy
  has_many :users, through: :islands_favorites
end
