FactoryBot.define do
  factory :post do
    content { '離島へいこう！' }
    prefecture { '沖縄県' }

    after(:build) do |post|
      post.image.attach(io: File.open('spec/fixtures/images/test.png'), filename: 'test.png')
    end
    # after (:build) do |post|
    #   post.image.attach(io: File.open("./spec/fixtures/images/test.png"), filename: 'test.png')
    # end
  end
end
