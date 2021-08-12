islands = ["波照間島", "石垣島", "座間味島", "宮古島", "父島", "母島"]
islands.each do |island|
  Island.create!(name: island)
end
