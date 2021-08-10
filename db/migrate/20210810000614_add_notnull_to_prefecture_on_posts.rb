class AddNotnullToPrefectureOnPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :prefecture, :integer, default: 0, null: false
  end
end
