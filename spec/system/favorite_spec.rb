# frozen_string_literal: true

require 'rails_helper'
RSpec.describe 'お気に入り機能', type: :system do
  describe 'お気に入り登録機能' do
    before do
      @post = FactoryBot.create(:post)
      visit new_user_session_path
      click_link 'ゲストログイン'
    end
    context 'お気に入りボタンを押した場合' do
      it 'お気に入り一覧画面にストックされる' do
        visit posts_path
        find('#link').click
        sleep 0.3
        visit favorites_path
        expect(page).to have_content '離島へいこう！'
        expect(page).to have_content '沖縄県'
      end
    end
    context 'お気に入り解除ボタンを押した場合' do
      it '一覧画面にストックされた内容が表示されない' do
        visit posts_path
        find('#link').click
        find('#test-link').click
        visit favorites_path
        expect(page).not_to have_content '離島へいこう！'
        expect(page).not_to have_content '沖縄県'
      end
    end
  end
end
