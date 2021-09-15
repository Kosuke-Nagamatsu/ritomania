require 'rails_helper'
RSpec.describe '投稿の検索機能', type: :system do
  describe 'あいまい検索機能' do
    before do
      @post = FactoryBot.create(:post)
      visit new_user_session_path
      click_link 'ゲストログイン'
    end
    context '投稿本文で検索する場合' do
      it '検索内容を含む投稿のみ表示される' do
        visit posts_path
        fill_in 'q_content_or_comments_content_cont', with: '離島へいこう！'
        find('.test').click
        expect(page).to have_content '離島へいこう！'
        expect(page).to have_content '沖縄県'
        expect(page).to have_content 'A島'
      end
    end
  end
  describe '離島名で検索機能' do
    context '離島名で検索する場合' do
      before do
        @post = FactoryBot.create(:post)
        visit new_user_session_path
        click_link 'ゲストログイン'
      end
      it '検索内容を含む投稿のみ表示される' do
        select 'A島', from: 'q[islands_id_eq]'
        find('.test').click
        expect(page).to have_content '離島へいこう！'
        expect(page).to have_content '沖縄県'
        expect(page).to have_content 'A島'
      end
    end
  end
  describe '都道府県名検索機能' do
    before do
      @post = FactoryBot.create(:post)
      visit new_user_session_path
      click_link 'ゲストログイン'
    end
    context '都道府県名で検索する場合' do
      it '検索内容を含む投稿のみ表示される' do
        find('#show-hide-btn').click
        choose 'q_prefecture_eq_47'
        find('.test2').click
        expect(page).to have_content '離島へいこう！'
        expect(page).to have_content '沖縄県'
        expect(page).to have_content 'A島'
      end
    end
  end
end
