# frozen_string_literal: true

class PostIsland < ApplicationRecord
  belongs_to :post
  belongs_to :island
end
