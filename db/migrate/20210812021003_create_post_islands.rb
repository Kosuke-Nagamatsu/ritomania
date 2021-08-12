class CreatePostIslands < ActiveRecord::Migration[5.2]
  def change
    create_table :post_islands do |t|
      t.references :post, foreign_key: true
      t.references :island, foreign_key: true

      t.timestamps
    end
  end
end
