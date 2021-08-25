require 'rails_helper'
describe '離島モデル機能', type: :model do
  describe 'バリデーションのテスト' do
    before do
      island = FactoryBot.create(:island)
    end
    context 'すでに登録されている離島名を作成する場合' do
      it 'バリデーションにひっかかる' do
        island2 = Island.create(name: "A島")
        expect(island2).not_to be_valid
      end
    end
    context 'まだ登録されていない離島名を作成する場合' do
      it 'バリデーションが通る' do
        island2 = Island.create(name: "B島")
        expect(island2).to be_valid
      end
    end
  end
end
