class AddCityIdToIslands < ActiveRecord::Migration[5.2]
  def change
    add_column :islands, :city_id, :integer, null: false
  end
end
