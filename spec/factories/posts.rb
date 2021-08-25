FactoryBot.define do
  factory :post do
    content { '失敗テスト' }
    prefecture { '北海道' }
  end
  # after(:build) do |post|
  #   post.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'images', 'test.png')), filename: 'test.png', content_type: 'image/png')
  # end
end
