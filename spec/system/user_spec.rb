require 'rails_helper'
RSpec.describe 'ユーザ機能', type: :system do
  describe 'ユーザ登録機能' do
    context '必要事項を記入後にアカウント登録を押した場合' do
      it '登録が完了し、ユーザ詳細画面へ遷移する' do
        visit new_user_registration_path
        fill_in 'user_name', with: 'りとう太郎'
        fill_in 'user_email', with: 'ritotaro@example.com'
        fill_in 'user_password', with: 'password'
        fill_in 'user_password_confirmation', with: 'password'
        click_button 'アカウント登録'
        expect(page).to have_content 'りとう太郎'
      end
    end
  end
  describe 'ユーザログイン機能' do
    before do
      @user = FactoryBot.create(:user)
    end
    context 'ログインした場合' do
      it 'ログインが完了し、投稿一覧画面へ遷移する' do
        visit new_user_session_path
        fill_in 'user_email', with: 'ritotaro@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        expect(page).to have_content '気になる離島を見つけてみよう！'
      end
    end
    context 'ログアウトした場合' do
      it 'ログアウトし、トップページへ遷移する' do
        visit new_user_session_path
        fill_in 'user_email', with: 'ritotaro@example.com'
        fill_in 'user_password', with: 'password'
        click_button 'ログイン'
        click_link 'マイページ'
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
        expect(page).to have_content 'りとうまにあ'
      end
    end
    context 'ゲストログインを押した場合' do
      it 'ログインが完了し、投稿一覧画面へ遷移する' do
        visit new_user_session_path
        click_link 'ゲストログイン'
        expect(page).to have_content '気になる離島を見つけてみよう！'
      end
    end
    context '管理者ゲストログインボタン押下' do
      it 'ログインが完了し、投稿一覧画面へ遷移する' do
        visit new_user_session_path
        click_link '管理者ゲストログイン'
        expect(page).to have_content '気になる離島を見つけてみよう！'
      end
    end
  end
  describe 'ユーザ編集機能' do
    before do
      @user = FactoryBot.create(:user)
      visit new_user_session_path
      fill_in 'user_email', with: 'ritotaro@example.com'
      fill_in 'user_password', with: 'password'
      click_button 'ログイン'
    end
    context 'ユーザ編集内容を入力後に更新ボタンを押した場合' do
      it 'ユーザ編集が完了し、ユーザ詳細画面へ遷移する' do
        visit edit_user_registration_path
        fill_in 'user_name', with: 'りとう花子'
        fill_in 'user_email', with: 'hanako@example.com'
        fill_in 'user_password', with: 'password2'
        fill_in 'user_password_confirmation', with: 'password2'
        fill_in 'user_current_password', with: 'password'
        click_on '更新'
        expect(page).to have_content 'りとう花子'
        expect(page).to have_content 'hanako@example.com'
      end
    end
  end
end
