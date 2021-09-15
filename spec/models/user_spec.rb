# frozen_string_literal: true

require 'rails_helper'
describe 'ユーザモデル機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'ユーザ名が空白の場合' do
      it 'バリデーションにひっかかる' do
        user = User.create(name: '', email: 'ritotaro@example.com', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'ユーザ名が31文字以上の場合' do
      it 'バリデーションにひっかかる' do
        user = User.create(name: 'a' * 31, email: 'ritotaro@example.com', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが空白の場合' do
      it 'バリデーションにひっかかる' do
        user = User.create(name: 'りとうたろう', email: '', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが有効なフォーマットでない場合１' do
      it 'バリデーションにひっかかる' do
        user = User.create(name: 'りとうたろう', email: 'ritotaro@', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが有効なフォーマットでない場合２' do
      it 'バリデーションにひっかかる' do
        user = User.create(name: 'りとうたろう', email: 'ritotaro', password: 'password')
        expect(user).not_to be_valid
      end
    end
    context 'メールアドレスが既に存在する場合' do
      it 'バリデーションにひっかかる' do
        user = User.create(name: 'りとうたろう', email: 'ritotaro@example.com', password: 'password')
        user2 = User.create(name: 'りとうたろう2', email: 'ritotaro@example.com', password: 'password2')
        expect(user2).not_to be_valid
      end
    end
    context 'パスワードが空白の場合' do
      it 'バリデーションにひっかかる' do
        user = User.create(name: 'りとうたろう', email: 'ritotaro@example.com', password: '')
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが5文字の場合' do
      it 'バリデーションにひっかかる' do
        user = User.create(name: 'りとうたろう', email: 'ritotaro@example.com', password: 'a' * 5)
        expect(user).not_to be_valid
      end
    end
    context 'パスワードが6文字の場合' do
      it 'バリデーションが通る' do
        user = User.create(name: 'りとうたろう', email: 'ritotaro@example.com', password: 'a' * 6)
        expect(user).to be_valid
      end
    end
    context '名前、メールアドレス、パスワードに内容が記載されている場合' do
      it 'バリデーションが通る' do
        user = FactoryBot.create(:user)
        expect(user).to be_valid
      end
    end
  end
end
