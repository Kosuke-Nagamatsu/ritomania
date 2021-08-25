require 'rails_helper'
describe 'コメントモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'コメントの内容が空の場合' do
      it 'バリデーションにひっかる' do
        user = FactoryBot.create(:user)
        post = Post.create(
          image: ActiveStorage::Blob.create_after_upload!(io: File.open("#{Rails.root}/spec/fixtures/images/test.png"), filename: 'test.png'),
          content: "離島へいこう！",
          prefecture: "沖縄県",
          user_id: user.id
        )
        comment = Comment.create( content: "", user_id: user.id, post_id: post.id )
        expect(comment).not_to be_valid
      end
    end
    context 'コメントに内容が記載されている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        post = Post.create(
          image: ActiveStorage::Blob.create_after_upload!(io: File.open("#{Rails.root}/spec/fixtures/images/test.png"), filename: 'test.png'),
          content: "離島へいこう！",
          prefecture: "沖縄県",
          user_id: user.id
        )
        comment = Comment.create( content: "海がきれいですね！", user_id: user.id, post_id: post.id )
        expect(comment).to be_valid
      end
    end
  end
end
