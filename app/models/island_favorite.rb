# frozen_string_literal: true

class IslandFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :island
end
