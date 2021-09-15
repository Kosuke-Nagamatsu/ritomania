# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'りとうたろう' }
    email { 'ritotaro@example.com' }
    password { 'password' }
  end
end
