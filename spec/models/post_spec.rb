require 'rails_helper'
describe 'ポストモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
    end
    context 'ポストの本文が空の場合' do
      it 'バリデーションにひっかる' do
        post = FactoryBot.create(:post)
        # post.image = fixture_file_upload("files/test.png")
        expect(post).not_to be_valid
      end
    end
  # context 'ポストの都道府県が空の場合' do
  #     it 'バリデーションにひっかかる' do
  #       # ここに内容を記載する
  #     end
  #   end
  end
end
