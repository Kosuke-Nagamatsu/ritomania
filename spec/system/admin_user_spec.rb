# frozen_string_literal: true

require 'rails_helper'
RSpec.describe '管理者機能', type: :system do
  describe '管理者画面機能' do
    context '管理者ゲストログイン後に管理者ページを押した場合' do
      it '管理者画面へ遷移する' do
        visit new_user_session_path
        click_link '管理者ゲストログイン'
        click_link 'マイページ'
        click_link '管理者ページ'
        expect(page).to have_content 'サイト管理'
      end
    end
    context '一般ゲストでログインした場合' do
      it 'グローバルナビゲーションに管理者ページのリンクが表示されない' do
        visit new_user_session_path
        click_link 'ゲストログイン'
        click_link 'マイページ'
        expect(page).not_to have_content '管理者ページ'
      end
    end
  end
end
