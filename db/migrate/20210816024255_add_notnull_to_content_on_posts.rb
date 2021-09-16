# frozen_string_literal: true

class AddNotnullToContentOnPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :content, :text, null: false
  end
end
