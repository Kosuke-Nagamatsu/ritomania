class Island < ApplicationRecord
  has_many :post_islands, dependent: :destroy
  has_many :posts, through: :post_islands, source: :post
end
