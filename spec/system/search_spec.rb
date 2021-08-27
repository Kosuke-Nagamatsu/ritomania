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
        fill_in 'キーワード', with: '離島へいこう！'
        find('.test').click
        expect(page).to have_content '離島へいこう！'
        expect(page).to have_content '沖縄県'
      end
    end
  end
    context '離島名で検索する場合' do
      before do
        @island = FactoryBot.create(:island)
        visit new_user_session_path
        click_link 'ゲストログイン'
      end
      it '検索内容を含む投稿のみ表示される' do
        visit new_post_path
        attach_file 'post[image]',
           "./spec/fixtures/images/test.png"
        fill_in 'post_content', with: 'A島に行きました'
        find("option[value='北海道']").select_option
        check "A島"
        click_button '投稿する'
        click_button '投稿する'
        select 'A島', from: 'q[islands_id_eq]'
        find('.test').click
        expect(page).to have_content 'A島に行きました'
        expect(page).to have_content '北海道'
        expect(page).to have_content 'A島'
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
          find("option[value='47']").select_option
          find('.test2').click
          expect(page).to have_content '離島へいこう！'
          expect(page).to have_content '沖縄県'
        end
      end
  end
end
