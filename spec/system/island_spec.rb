require 'rails_helper'
RSpec.describe '離島の詳細表示機能', type: :system do
  describe '天気予報機能' do
    before do
      @post = FactoryBot.create(:post)
      visit new_user_session_path
      click_link 'ゲストログイン'
      visit post_path(@post)
    end
    context '離島詳細画面に遷移し、天気予報の取得に失敗する場合' do
      it 'フラッシュメッセージ「天気予報を表示できませんでした」が表示される' do
        find('.island-box a').click
        expect(find('.alert-error', visible: false).text(:all) ).to have_content '天気予報を表示できませんでした'
      end
      it 'weathersクラスの要素が表示されない' do
        find('.island-box a').click
        expect(page).not_to have_css '.weathers'
      end
    end
    context '離島詳細画面に遷移し、天気予報の取得に成功する場合' do
      it '「船泊」の文字が表示される' do
        @post.islands.update(city_id: 2130316)
        find('.island-box a').click
        expect(page).to have_content '船泊'
      end
      it '日時の要素が5つあり、最初の要素に値が存在する' do
        @post.islands.update(city_id: 2130316)
        find('.island-box a').click
        expect(page.all('.weather-date').count).to eq 5
        expect(page.all('.weather-date')[0]).to be
      end
      it 'メインの要素が5つあり、最初の要素に値が存在する' do
        @post.islands.update(city_id: 2130316)
        find('.island-box a').click
        expect(page.all('.weather-main').count).to eq 5
        expect(page.all('.weather-main')[0]).to be
      end
      it '気温の要素が5つあり、最初の要素に「.」の文字が存在する' do
        @post.islands.update(city_id: 2130316)
        find('.island-box a').click
        expect(page.all('.weather-temp').count).to eq 5
        expect(page.all('.weather-temp')[0]).to have_content '.'
      end
    end
  end
end
