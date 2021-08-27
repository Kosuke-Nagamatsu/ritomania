require 'rails_helper'
RSpec.describe 'コメント機能', type: :system do
  describe 'コメント作成機能' do
    before do
      @post = FactoryBot.create(:post)
      visit new_user_session_path
      click_link 'ゲストログイン'
    end
    context 'コメントを新規作成する場合' do
      it 'コメントを投稿すると詳細ページに表示される' do
        visit post_path(@post)
        fill_in 'comment[content]', with: 'コメントテスト'
        click_button '投稿する'
        expect(page).to have_content 'コメントテスト'
      end
    end
  end
end
