# frozen_string_literal: true

class AddIndexToIslandsName < ActiveRecord::Migration[5.2]
  def change
    add_index :islands, :name, unique: true
  end
end
