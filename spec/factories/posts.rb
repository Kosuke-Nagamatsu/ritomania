# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :user, factory: :user
    content { '離島へいこう！' }
    prefecture { '沖縄県' }

    after(:build) do |post|
      post.image.attach(io: File.open('./spec/fixtures/images/test.png'), filename: 'test.png')

      island = create(:island)
      post.post_islands << build(:post_island, post: post, island: island)
    end
  end
end
