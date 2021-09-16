# frozen_string_literal: true

class CreateIslandFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :island_favorites do |t|
      t.references :user, foreign_key: true
      t.references :island, foreign_key: true

      t.timestamps
    end
  end
end
