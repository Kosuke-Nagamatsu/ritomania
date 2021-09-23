# frozen_string_literal: true

require "csv"
# Islandデータ
CSV.foreach('db/islands_list.csv', headers: true) do |row|
  Island.create(
    name: row['name'],
    city_id: row['city_id']
  )
end

# Userデータ
user = User.create(name: 'アポル',
                   email: 'apple@aaa.com',
                   password: 'password')
user.icon.attach(io: File.open('./db/images/icon-apple.png'), filename: 'icon-apple.png')
user = User.create(name: 'ツーリ',
                   email: 'tree@ttt.com',
                   password: 'password')
user.icon.attach(io: File.open('./db/images/icon-tree.png'), filename: 'icon-tree.png')
user = User.create(name: 'うさ吉',
                   email: 'rabbit@rrr.com',
                   password: 'password')
user.icon.attach(io: File.open('./db/images/icon-rabbit.png'), filename: 'icon-rabbit.png')
user = User.create(name: 'わんこ',
                   email: 'dog@ddd.com',
                   password: 'password')
user.icon.attach(io: File.open('./db/images/icon-dog.png'), filename: 'icon-dog.png')
user = User.create(name: 'ピナッツー',
                   email: 'peanut@ppp.com',
                   password: 'password')
user.icon.attach(io: File.open('./db/images/icon-peanut.png'), filename: 'icon-peanut.png')
user = User.create(name: 'タイセツ',
                   email: 'money@mmm.com',
                   password: 'password')
user = User.create(name: 'ナンシー',
                   email: 'nashi@nnn.com',
                   password: 'password')
user = User.create(name: 'バード',
                   email: 'bird@bbb.com',
                   password: 'password')
user = User.create(name: 'ニャン',
                   email: 'cat@ccc.com',
                   password: 'password')
user.icon.attach(io: File.open('./db/images/icon-cat.png'), filename: 'icon-cat.png')

# Postデータ
post = Post.new(
  content: '歴史だなぁ。',
  prefecture: '長崎県',
  user_id: User.first.id
)
post.image.attach(io: File.open('./db/images/post-fukue.jpg'), filename: 'post-fukue.jpg')
post.save!
post = Post.new(
  content: '鯛が釣れるとは。。',
  prefecture: '高知県',
  user_id: User.find(2).id
)
post.image.attach(io: File.open('./db/images/post-uguru.jpg'), filename: 'post-uguru.jpg')
post.save!
post = Post.new(
  content: '橋がきれい!ここが宮古で一番きれいかも。',
  prefecture: '沖縄県',
  user_id: User.find(3).id
)
post.image.attach(io: File.open('./db/images/post-miyako.jpg'), filename: 'post-miyako.jpg')
post.save!
post = Post.new(
  content: '波照間ブルー',
  prefecture: '沖縄県',
  user_id: User.find(4).id
)
post.image.attach(io: File.open('./db/images/post-hateruma.jpg'), filename: 'post-hateruma.jpg')
post.save!
post = Post.new(
  content: '向こうに見えるのが淡路島〜',
  prefecture: '兵庫県',
  user_id: User.find(5).id
)
post.image.attach(io: File.open('./db/images/post-awaji.jpg'), filename: 'post-awaji.jpg')
post.save!
post = Post.new(
  content: '慶良間ブルー',
  prefecture: '沖縄県',
  user_id: User.find(1).id
)
post.image.attach(io: File.open('./db/images/post-aka.jpg'), filename: 'post-aka.jpg')
post.save!

# Favoriteデータ
User.all.each do |user|
  favorite = Favorite.new(
    user_id: user.id,
    post_id: Post.find(3).id
  )
  favorite.save!
end

# PostIslandデータ
post_island = PostIsland.new(
  post_id: Post.find(1).id,
  island_id: Island.find(304).id
)
post_island.save!
post_island = PostIsland.new(
  post_id: Post.find(2).id,
  island_id: Island.find(218).id
)
post_island.save!
post_island = PostIsland.new(
  post_id: Post.find(3).id,
  island_id: Island.find(400).id
)
post_island.save!
post_island = PostIsland.new(
  post_id: Post.find(4).id,
  island_id: Island.find(418).id
)
post_island.save!
post_island = PostIsland.new(
  post_id: Post.find(5).id,
  island_id: Island.find(52).id
)
post_island.save!
post_island = PostIsland.new(
  post_id: Post.find(6).id,
  island_id: Island.find(393).id
)
post_island.save!
# Commentデータ
comment = Comment.new(
  user_id: User.find(1).id,
  post_id: Post.find(3).id,
  content: 'あの奥に見える橋はなんですか？'
)
comment.save!
comment = Comment.new(
  user_id: User.find(3).id,
  post_id: Post.find(3).id,
  content: 'あれは〇〇です！'
)
comment.save!
comment = Comment.new(
  user_id: User.find(1).id,
  post_id: Post.find(3).id,
  content: 'へー。そうなんですね。。めっちゃ綺麗なんで絶対いきます！'
)
comment.save!
comment = Comment.new(
  user_id: User.find(3).id,
  post_id: Post.find(3).id,
  content: 'せひぜひ〜'
)
comment.save!
comment = Comment.new(
  user_id: User.find(9).id,
  post_id: Post.find(5).id,
  content: 'あそこに行けばうまい玉ねぎが食べれるのか〜'
)
comment.save!
comment = Comment.new(
  user_id: User.find(3).id,
  post_id: Post.find(6).id,
  content: 'あかじま？って沖縄のどこ？'
)
comment.save!
comment = Comment.new(
  user_id: User.find(1).id,
  post_id: Post.find(6).id,
  content: '本島から西の方にあるんですよ。高速船でだいたい50分くらいです！'
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
