# Userデータ
user = User.create(name: "アポル",
                  email: "apple@aaa.com",
                  password: "password")
user.icon.attach(io: File.open( "./db/images/apple.png"), filename: "apple.png")
user = User.create(name: "ツーリ",
                  email: "tree@ttt.com",
                  password: "password")
user.icon.attach(io: File.open('./db/images/tree.png'), filename: 'tree.png')
user = User.create(name: "うさ吉",
                  email: "rabbit@rrr.com",
                  password: "password")
user.icon.attach(io: File.open('./db/images/rabbit.png'), filename: 'rabbit.png')
user = User.create(name: "わんこ",
                  email: "dog@ddd.com",
                  password: "password")
user.icon.attach(io: File.open('./db/images/dog.png'), filename: 'dog.png')
user = User.create(name: "ピナッツー",
                  email: "peanut@ppp.com",
                  password: "password")
user.icon.attach(io: File.open('./db/images/peanut.png'), filename: 'peanut.png')
user = User.create(name: "タイセツ",
                  email: "money@mmm.com",
                  password: "password")
user.icon.attach(io: File.open('./db/images/peanut.png'), filename: 'peanut.png')
user = User.create(name: "フ・ナンシー",
                  email: "nashi@nnn.com",
                  password: "password")
user.icon.attach(io: File.open('./db/images/peanut.png'), filename: 'peanut.png')
user = User.create(name: "バード",
                  email: "bird@bbb.com",
                  password: "password")
user.icon.attach(io: File.open('./db/images/peanut.png'), filename: 'peanut.png')
user = User.create(name: "ニャン",
                  email: "cat@ccc.com",
                  password: "password")
user.icon.attach(io: File.open('./db/images/peanut.png'), filename: 'peanut.png')

# Postデータ
post = Post.new(
  content: "歴史だなぁ。",
  prefecture: "長崎県",
  user_id: User.first.id
 )
post.image.attach(io: File.open('./db/images/fukue.jpg'), filename: 'fukue.jpg')
post.save!
post = Post.new(
  content: "いただきます！",
  prefecture: "高知県",
  user_id: User.find(2).id
 )
post.image.attach(io: File.open('./db/images/uguru.jpg'), filename: 'uguru.jpg')
post.save!
post = Post.new(
  content: "鯛が釣れるとは。。",
  prefecture: "高知県",
  user_id: User.find(2).id
 )
post.image.attach(io: File.open('./db/images/uguru2.jpg'), filename: 'uguru2.jpg')
post.save!
post = Post.new(
  content: "橋がきれい!ここが宮古で一番きれいかも。",
  prefecture: "沖縄県",
  user_id: User.find(3).id
 )
post.image.attach(io: File.open('./db/images/miyako.jpg'), filename: 'miyako.jpg')
post.save!
post = Post.new(
  content: "波照間ブルー",
  prefecture: "沖縄県",
  user_id: User.find(4).id
 )
post.image.attach(io: File.open('./db/images/hateruma.jpg'), filename: 'hateruma.jpg')
post.save!
post = Post.new(
  content: "向こうに見えるのが淡路島〜",
  prefecture: "兵庫県",
  user_id: User.find(5).id
 )
post.image.attach(io: File.open('./db/images/awaji.jpg'), filename: 'awaji.jpg')
post.save!
post = Post.new(
  content: "慶良間ブルー",
  prefecture: "沖縄県",
  user_id: User.find(1).id
 )
post.image.attach(io: File.open('./db/images/aka.jpg'), filename: 'aka.jpg')
post.save!

# Favoriteデータ
User.all.each do |user|
  favorite = Favorite.new(
    user_id: user.id,
    post_id: Post.find(4).id
  )
  favorite.save!
end

# Islandデータ
islands = ["波照間島", "宮古島", "阿嘉島", "福江島", "鵜来島", "淡路島"]
islands.each do |island|
  Island.create!(name: island)
end

# PostIslandデータ
post_island = PostIsland.new(
  post_id: Post.find(1).id,
  island_id: Island.find(4).id
)
post_island.save!
post_island = PostIsland.new(
  post_id: Post.find(2).id,
  island_id: Island.find(5).id
)
post_island.save!
post_island = PostIsland.new(
  post_id: Post.find(3).id,
  island_id: Island.find(5).id
)
post_island.save!
post_island = PostIsland.new(
  post_id: Post.find(4).id,
  island_id: Island.find(2).id
)
post_island.save!
post_island = PostIsland.new(
  post_id: Post.find(5).id,
  island_id: Island.find(1).id
)
post_island.save!
post_island = PostIsland.new(
  post_id: Post.find(6).id,
  island_id: Island.find(6).id
)
post_island.save!
post_island = PostIsland.new(
  post_id: Post.find(7).id,
  island_id: Island.find(3).id
)
post_island.save!

# Commentデータ
# comment = Comment.new(
#   user_id: User.find(1).id,
#   post_id: Post.find(4).id,
#   content: "あの奥に見える橋はなんですか？"
# )
# comment.save!
comment = Comment.new(
  user_id: User.find(3).id,
  post_id: Post.find(4).id,
  content: "あれは〇〇です！"
)
comment.save!
comment = Comment.new(
  user_id: User.find(1).id,
  post_id: Post.find(4).id,
  content: "へー。そうなんですね。。めっちゃ綺麗なんで絶対いきます！"
)
comment.save!
comment = Comment.new(
  user_id: User.find(3).id,
  post_id: Post.find(4).id,
  content: "せひぜひ〜"
)
comment.save!
comment = Comment.new(
  user_id: User.find(6).id,
  post_id: Post.find(6).id,
  content: "あそこに行けばうまい玉ねぎが食べれるのか〜"
)
comment.save!
comment = Comment.new(
  user_id: User.find(3).id,
  post_id: Post.find(7).id,
  content: "あかじま？って沖縄のどこ？"
)
comment.save!
comment = Comment.new(
  user_id: User.find(1).id,
  post_id: Post.find(7).id,
  content: "本島から西の方にあるんですよ。高速船でだいたい50分くらいです！"
)
comment.save!

# IslandFavoriteデータ
User.all.each do |user|
  island_favorite = IslandFavorite.new(
    user_id: user.id,
    island_id: Island.find(2).id
  )
  island_favorite.save!
end
