require 'rails_helper'
describe 'ポストモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'ポストの写真が未選択の場合' do
      it 'バリデーションにひっかる' do
        user = FactoryBot.create(:user)
        post = Post.create( image: nil, content: "離島へいこう！", prefecture: "沖縄県", user_id: user.id )
        expect(post).not_to be_valid
      end
    end
    context 'ポストの本文が空の場合' do
      it 'バリデーションにひっかる' do
        user = FactoryBot.create(:user)
        post = Post.create(
          image: ActiveStorage::Blob.create_after_upload!(io: File.open("#{Rails.root}/spec/fixtures/images/test.png"), filename: 'test.png'),
          content: "",
          prefecture: "沖縄県",
          user_id: user.id
        )
        expect(post).not_to be_valid
      end
    end
    context 'ポストの都道府県が空の場合' do
      it 'バリデーションにひっかかる' do
        user = FactoryBot.create(:user)
        post = Post.create(
          image: ActiveStorage::Blob.create_after_upload!(io: File.open("#{Rails.root}/spec/fixtures/images/test.png"), filename: 'test.png'),
          content: "離島へいこう！",
          prefecture: "",
          user_id: user.id
        )
        expect(post).not_to be_valid
      end
    end
    context 'ポストの写真を選択し、本文・都道府県に内容が入っている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        post = Post.create(
          image: ActiveStorage::Blob.create_after_upload!(io: File.open("#{Rails.root}/spec/fixtures/images/test.png"), filename: 'test.png'),
          content: "離島へいこう！",
          prefecture: "沖縄県",
          user_id: user.id
        )
        expect(post).to be_valid
      end
    end
  end
end
