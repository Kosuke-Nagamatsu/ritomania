require 'rails_helper'
RSpec.describe '旅の思い出CRUD機能', type: :system do
  describe '新規作成機能' do
    before do
      @island = FactoryBot.create(:island)
      visit new_user_session_path
      click_link 'ゲストログイン'
    end
    context '新規投稿する場合' do
      it '確認画面で送信を押すと投稿が完了し、一覧画面で内容が表示される' do
        find('.btn-modal').click
        attach_file 'post[image]',
                    './spec/fixtures/images/test.png'
        fill_in 'post_content', with: 'A島に行きました'
        find('#post-show-hide-btn').click
        choose 'post_prefecture_北海道'
        click_button '送信'
        click_button '送信'
        expect(page).to have_content '気になる離島を見つけよう！'
        expect(page).to have_content 'A島に行きました'
        expect(page).to have_content '北海道'
      end
    end
  end
  describe '詳細表示機能' do
    context '投稿詳細画面へ遷移する場合' do
      before do
        @post = FactoryBot.create(:post)
        visit new_user_session_path
        fill_in 'user_email', with: 'ritotaro@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
      end
      it '投稿内容が表示される' do
        visit post_path(@post)
        expect(page).to have_content '離島へいこう！'
        expect(page).to have_content '沖縄県'
        expect(page).to have_content 'A島'
      end
    end
  end
  describe '編集機能' do
    before do
      @post = FactoryBot.create(:post)
      visit new_user_session_path
      fill_in 'user_email', with: 'ritotaro@example.com'
      fill_in 'user_password', with: 'password'
      click_button 'ログイン'
    end
    context '投稿を編集する場合' do
      it '送信を押すと更新が完了し、一覧画面で内容が表示される' do
        visit post_path(@post)
        find('.link-modal').click
        attach_file 'post[image]',
                    './spec/fixtures/images/test.png'
        fill_in 'post_content', with: '次はB島へ行きます！'
        find('#post-show-hide-btn').click
        choose 'post_prefecture_北海道'
        find('.post-form').click_button '送信'
        expect(page).to have_content '気になる離島を見つけよう！'
        expect(page).to have_content '次はB島へ行きます！'
        expect(page).to have_content '北海道'
        expect(page).to have_content 'A島'
      end
    end
  end
  describe '削除機能' do
    before do
      @post = FactoryBot.create(:post)
      visit new_user_session_path
      fill_in 'user_email', with: 'ritotaro@example.com'
      fill_in 'user_password', with: 'password'
      click_button 'ログイン'
    end
    context '投稿を削除する場合' do
      it '削除後に一覧画面へ遷移し、削除した内容が表示されない' do
        visit post_path(@post)
        find('.show-box .fa-trash-o').click
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content '気になる離島を見つけよう！'
        expect(page).not_to have_content '離島へ行こう！'
      end
    end
  end
end
