# frozen_string_literal: true

class AddNotnullToContentOnComments < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :content, :text, null: false
  end
end
