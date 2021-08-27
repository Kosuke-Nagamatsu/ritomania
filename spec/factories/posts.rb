FactoryBot.define do
  factory :post do
    association :user, factory: :user
    content { '離島へいこう！' }
    prefecture { '沖縄県' }

    after(:build) do |post|
      post.image.attach(io: File.open('./spec/fixtures/images/test.png'), filename: 'test.png')
      # island = create(:island)
      # post.post_islands << build(:post_islands, post: post, island: island)
    end
  end

  # factory :second_bost, class: Post do
  #   association :user, factory: :user
  #   content { '家にいよう！' }
  #   prefecture { '北海道' }
  #
  #   after(:build) do |post|
  #     post.image.attach(io: File.open('./spec/fixtures/images/test.png'), filename: 'test.png')
  #     # island = create(:island)
  #     # post.post_islands << build(:post_islands, post: post, island: island)
  #   end
    # after (:build) do |post|
    #   post.image.attach(io: File.open("./spec/fixtures/images/test.png"), filename: 'test.png')
    # end
  # end
end
