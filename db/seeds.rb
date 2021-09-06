# Userデータ
# user = User.create(name: "アポル",
#                   email: "apple@aaa.com",
#                   password: "password")
# user.icon.attach(io: File.open( "./db/images/icon-apple.png"), filename: "icon-apple.png")
# user = User.create(name: "ツーリ",
#                   email: "tree@ttt.com",
#                   password: "password")
# user.icon.attach(io: File.open('./db/images/icon-tree.png'), filename: 'icon-tree.png')
# user = User.create(name: "うさ吉",
#                   email: "rabbit@rrr.com",
#                   password: "password")
# user.icon.attach(io: File.open('./db/images/icon-rabbit.png'), filename: 'icon-rabbit.png')
# user = User.create(name: "わんこ",
#                   email: "dog@ddd.com",
#                   password: "password")
# user.icon.attach(io: File.open('./db/images/icon-dog.png'), filename: 'icon-dog.png')
# user = User.create(name: "ピナッツー",
#                   email: "peanut@ppp.com",
#                   password: "password")
# user.icon.attach(io: File.open('./db/images/icon-peanut.png'), filename: 'icon-peanut.png')
# user = User.create(name: "タイセツ",
#                   email: "money@mmm.com",
#                   password: "password")
# user = User.create(name: "ナンシー",
#                   email: "nashi@nnn.com",
#                   password: "password")
# user = User.create(name: "バード",
#                   email: "bird@bbb.com",
#                   password: "password")
# user = User.create(name: "ニャン",
#                   email: "cat@ccc.com",
#                   password: "password")
# user.icon.attach(io: File.open('./db/images/icon-cat.png'), filename: 'icon-cat.png')

# Postデータ
# post = Post.new(
#   content: "歴史だなぁ。",
#   prefecture: "長崎県",
#   user_id: User.first.id
#  )
# post.image.attach(io: File.open('./db/images/post-fukue.jpg'), filename: 'post-fukue.jpg')
# post.save!
# post = Post.new(
#   content: "鯛が釣れるとは。。",
#   prefecture: "高知県",
#   user_id: User.find(2).id
#  )
# post.image.attach(io: File.open('./db/images/post-uguru.jpg'), filename: 'post-uguru.jpg')
# post.save!
# post = Post.new(
#   content: "橋がきれい!ここが宮古で一番きれいかも。",
#   prefecture: "沖縄県",
#   user_id: User.find(3).id
#  )
# post.image.attach(io: File.open('./db/images/post-miyako.jpg'), filename: 'post-miyako.jpg')
# post.save!
# post = Post.new(
#   content: "波照間ブルー",
#   prefecture: "沖縄県",
#   user_id: User.find(4).id
#  )
# post.image.attach(io: File.open('./db/images/post-hateruma.jpg'), filename: 'post-hateruma.jpg')
# post.save!
# post = Post.new(
#   content: "向こうに見えるのが淡路島〜",
#   prefecture: "兵庫県",
#   user_id: User.find(5).id
#  )
# post.image.attach(io: File.open('./db/images/post-awaji.jpg'), filename: 'post-awaji.jpg')
# post.save!
# post = Post.new(
#   content: "慶良間ブルー",
#   prefecture: "沖縄県",
#   user_id: User.find(1).id
#  )
# post.image.attach(io: File.open('./db/images/post-aka.jpg'), filename: 'post-aka.jpg')
# post.save!

# Favoriteデータ
# User.all.each do |user|
#   favorite = Favorite.new(
#     user_id: user.id,
#     post_id: Post.find(3).id
#   )
#   favorite.save!
# end

# Islandデータ
islands = [
  # 北海道・東北
  # '礼文島', '利尻島', '焼尻島', '天売島', '奥尻島', '小島（北海道）',
  # '大島（気仙沼）', '出島', '江島（宮城）', '網地島', '田代島', '寒風沢島', '野々島', '桂島（宮城）', '朴島', '金華山', '宮戸島',
  # '飛島（山形）',
  # # 関東
  # '大島(伊豆)', '利島', '新島（伊豆）', '式根島', '神津島', '三宅島', '御蔵島', '八丈島', '青ヶ島', '父島', '母島', '硫黄島（小笠原）', '南鳥島',
  # '仁右衛門島', '城ヶ島', '江の島',
  # # 中部
  # '粟島（新潟）', '佐渡島', '舳倉島','能登島', '初島', '佐久島','日間賀島', '篠島',
  # # 関西
  # '神島', '答志島', '菅島', '坂手島', '渡鹿野島', '間崎島', '賢島', '横山島', '沖島',
  # '淡路島', '沼島', '家島', '男鹿島', '坊勢島', '西島', '中の島', '紀伊大島',
  # # 中国
  # '島後', '中ノ島（島根）', '西ノ島', '知夫里島', '大根島', '江島（島根）',
  # '鹿久居島', '大多府島', '頭島', '鴻島', '長島（岡山）', '前島（岡山）', '黄島（岡山）', '黒島（岡山）', '犬島', '石島', '松島（岡山）', '六口島',
  # '高島（岡山）', '白石島', '北木島', '真鍋島', '小飛島', '大飛島', '六島（岡山）',
  # '走島', '田島', '横島（広島）', '百島', '向島（広島）', '岩子島', '細島', '因島', '佐木島', '小佐木島', '生口島', '高根島', '大久野島',
  # '契島', '生野島', '大崎上島', '大崎下島', '長島（広島）', '三角島', '豊島（広島）', '斎島', '大芝島',
  # '上蒲刈島', '下蒲刈島', '情島（広島）', '似島', '金輪島', '江田島・能美島', '沖野島', '倉橋島', '鹿島（広島）', '厳島', '阿多田島',
  # '端島', '柱島', '黒島（山口）', '屋代島', '笠佐島', '前島（山口）', '浮島', '情島（山口）', '沖家室島', '平郡島', '長島（山口）',
  # '八島', '祝島', '佐合島', '馬島（山口）', '牛島（山口）', '笠戸島', '粭島', '大津島', '野島', '向島（山口）', '竹ノ子島', '彦島', '見島', '相島（山口）',
  # '櫃島', '大島（山口）', '青海島', '角島', '蓋井島', '六連島',
  # # 四国
  # '大毛島', '島田島', '伊島', '出羽島', '竹ヶ島',
  # '小豆島', '沖之島（香川）', '小豊島', '豊島（香川）', '直島', '向島（香川）', '屏風島', '大島（香川）', '男木島', '女木島', '櫃石島',
  # '岩黒島', '与島', '小与島', '牛島（香川）', '本島', '広島', '手島', '小手島', '高見島', '佐柳島', '粟島（香川）', '志々島', '伊吹島',
  # '魚島', '高井神島', '弓削島', '佐島', '生名島', '岩城島', '赤穂根島', '大三島', '伯方島', '鵜島', '大島（今治）', '津島', '岡村島',
  # '小大下島', '大下島', '来島', '小島（愛媛）', '馬島（愛媛）', '比岐島', '新居大島', '安居島', '興居島', '釣島', '野忽那島', '睦月島', '中島（愛媛）',
  # '怒和島', '津和地島', '二神島', '青島（愛媛）', '大島（八幡浜）', '九島', '嘉島', '戸島（愛媛）', '日振島', '竹ケ島',
  # '中ノ島（高知）', '戸島（高知）', '柏島', '大島（高知）', '鵜来島', '沖の島',
  # # 九州
  # '馬島（福岡）', '藍島', '地島', '大島（福岡）', '相島（福岡）', '志賀島', '能古島', '玄界島', '小呂島', '姫島（福岡）',
  # '高島（佐賀）', '神集島', '加部島', '小川島', '加唐島', '松島（佐賀）', '馬渡島', '向島（佐賀）',
  #
  # '対馬島', '海栗島', '赤島（対馬）', '泊島', '沖ノ島', '島山島（対馬）', '壱岐島', '大島（壱岐）', '長島（長崎）', '原島', '若宮島', '福島', '鷹島',
  # '黒島（松浦）', '飛島（長崎）', '青島（長崎）', '的山大島', '度島', '平戸島', '高島（平戸）', '生月島', '前島（佐世保）', '鼕泊島', '黒島（佐世保）', '高島（佐世保）', '針尾島',
  # '大島（佐世保）', '竹ノ島', '鵜瀬島', '前島（時津）', '鹿島（長崎）', '大島（西海）', '寺島（西海）', '蛎浦島', '崎戸島', '江島（長崎）', '平島（長崎）', '南串島', '松島（長崎）', '池島',
  # '伊王島', '沖之島（長崎）', '高島（長崎市）', '樺島', '牧島（長崎）', '宇久島', '寺島（佐世保）', '六島（長崎）', '野崎島', '納島', '小値賀島', '斑島', '黒島（小値賀）', '大島（小値賀）',
  # '中通島', '頭ケ島', '桐ノ小島', '若松島', '漁生浦島', '有福島', '日ノ島', '奈留島', '前島（五島）', '久賀島', '蕨小島', '椛島', '福江島', '赤島（五島）',
  # '黄島（長崎）', '黒島（五島）', '島山島（五島）', '嵯峨島',
  #
  # '戸馳島', '大矢野島', '維和島', '野牛島', '湯島', '野釜島', '永浦島', '樋合島', '前島（熊本）', '中島（熊本）',
  # '天草上島', '樋島', '御所浦島', '牧島（熊本）', '横浦島', '天草下島', '通詞島', '横島（熊本）', '下須島',
  # '姫島（大分）', '黒島（大分）', '保戸島', '地無垢島', '大入島', '大島（大分）', '屋形島', '深島',
  # '島野浦島', '大島（宮崎）', '築島',
  # '獅子島', '伊唐島', '諸浦島', '長島（鹿児島）', '桂島（鹿児島）', '上甑島', '中甑島', '下甑島', '新島（鹿児島）', '種子島', '馬毛島',
  # '屋久島', '口永良部島', '竹島', '硫黄島（鹿児島）', '黒島（鹿児島）', '口之島', '中之島', '諏訪之瀬島', '平島（鹿児島）', '悪石島', '小宝島',
  # '宝島', '奄美大島', '加計呂麻島', '請島', '与路島', '喜界島', '徳之島', '沖永良部島', '与論島',
  # 沖縄
  '南大東島', '北大東島', '伊平屋島', '野甫島', '伊是名島', '宮城島(大宜味村)', '古宇利島', '屋我地島', '伊江島', '瀬底島',
  '水納島（本部）', '平安座島', '宮城島(うるま)', '伊計島', '浜比嘉島', '津堅島', '久高島', '奥武島（南城）',
  '瀬長島', '前島 in 沖縄', '渡嘉敷島', '座間味島', '阿嘉島', '慶留間島', '粟国島', '渡名喜島', '久米島', '奥武島/久米島町', 'オーハ島',
  '宮古島', '池間島', '大神島', '来間島', '伊良部島', '下地島', '多良間島', '水納島 -多良間-', '石垣島', '竹富島', '小浜島', '嘉弥真島',
  '黒島 in沖縄', '新城島上地', '新城島下地', '西表島', '由布島', '鳩間島', '波照間島', '外離島', '与那国島'
]
islands.each do |island|
  Island.create!(name: island)
end

# PostIslandデータ
# post_island = PostIsland.new(
#   post_id: Post.find(1).id,
#   island_id: Island.find(4).id
# )
# post_island.save!
# post_island = PostIsland.new(
#   post_id: Post.find(2).id,
#   island_id: Island.find(5).id
# )
# post_island.save!
# post_island = PostIsland.new(
#   post_id: Post.find(3).id,
#   island_id: Island.find(2).id
# )
# post_island.save!
# post_island = PostIsland.new(
#   post_id: Post.find(4).id,
#   island_id: Island.find(1).id
# )
# post_island.save!
# post_island = PostIsland.new(
#   post_id: Post.find(5).id,
#   island_id: Island.find(6).id
# )
# post_island.save!
# post_island = PostIsland.new(
#   post_id: Post.find(6).id,
#   island_id: Island.find(3).id
# )
# post_island.save!

# Commentデータ
# comment = Comment.new(
#   user_id: User.find(1).id,
#   post_id: Post.find(3).id,
#   content: "あの奥に見える橋はなんですか？"
# )
# comment.save!
# comment = Comment.new(
#   user_id: User.find(3).id,
#   post_id: Post.find(3).id,
#   content: "あれは〇〇です！"
# )
# comment.save!
# comment = Comment.new(
#   user_id: User.find(1).id,
#   post_id: Post.find(3).id,
#   content: "へー。そうなんですね。。めっちゃ綺麗なんで絶対いきます！"
# )
# comment.save!
# comment = Comment.new(
#   user_id: User.find(3).id,
#   post_id: Post.find(3).id,
#   content: "せひぜひ〜"
# )
# comment.save!
# comment = Comment.new(
#   user_id: User.find(9).id,
#   post_id: Post.find(5).id,
#   content: "あそこに行けばうまい玉ねぎが食べれるのか〜"
# )
# comment.save!
# comment = Comment.new(
#   user_id: User.find(3).id,
#   post_id: Post.find(6).id,
#   content: "あかじま？って沖縄のどこ？"
# )
# comment.save!
# comment = Comment.new(
#   user_id: User.find(1).id,
#   post_id: Post.find(6).id,
#   content: "本島から西の方にあるんですよ。高速船でだいたい50分くらいです！"
# )
# comment.save!

# IslandFavoriteデータ
# User.all.each do |user|
#   island_favorite = IslandFavorite.new(
#     user_id: user.id,
#     island_id: Island.find(2).id
#   )
#   island_favorite.save!
# end
