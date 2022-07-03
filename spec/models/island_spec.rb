require 'rails_helper'
describe '離島モデル機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      island = FactoryBot.create(:island)
    end
    context 'すでに登録されている離島名でテーブルに保存する場合' do
      it 'バリデーションにひっかかる' do
        island2 = Island.create(name: 'A島', city_id: 2)
        expect(island2).not_to be_valid
      end
    end
    context '登録されていない離島名でテーブルに保存する場合' do
      it 'バリデーションが通る' do
        island2 = Island.create(name: 'B島', city_id: 2)
        expect(island2).to be_valid
      end
    end
    context '離島名が空白の場合' do
      it 'バリデーションにひっかかる' do
        island = Island.create(name: '', city_id: 2)
        expect(island).not_to be_valid
      end
    end
  end
  describe 'インスタンスメソッドweather_reportsのテスト' do
    context '実行して天気予報の取得に成功した場合' do
      it '戻り値（ハッシュ）の:city_nameの値が「船泊」、:weathers 配列の要素数が5になる' do
        island = Island.new(name: '礼文島', city_id: 2130316)
        weather_reports = island.weather_reports
        expect(weather_reports[:city_name]).to eq '船泊'
        expect(weather_reports[:weathers].length).to eq 5
      end
      it ':weathers配列[0]のハッシュの各キーに値が存在する' do
        island = Island.new(name: '礼文島', city_id: 2130316)
        weather_reports = island.weather_reports
        expect(weather_reports[:weathers][0][:date]).to be
        expect(weather_reports[:weathers][0][:main]).to be
        expect(weather_reports[:weathers][0][:temp]).to be
        expect(weather_reports[:weathers][0][:icon]).to be
      end
    end
    context '天気予報の取得に失敗した場合（APIが提供していないcity_idでリクエストを送る場合）' do
      it 'nilが返る' do
        island = Island.new(name: 'B島', city_id: 1)
        weather_reports = island.weather_reports
        expect(weather_reports).to eq nil
      end
    end
  end
end
