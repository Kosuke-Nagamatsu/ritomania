# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :icon
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_posts, through: :favorites, source: :post
  has_many :comments, dependent: :destroy
  has_many :comment_posts, through: :comments, source: :post
  has_many :island_favorites, dependent: :destroy
  has_many :islands, through: :island_favorites, source: :island
  validates :name, length: { in: 1..30 }
  before_create :default_icon
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def default_icon
    unless icon.attached?
      icon.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_icon.jpg')),
                  filename: 'default_icon.jpg', content_type: 'image/jpg')
    end
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = '一般ゲスト'
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin-guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = '管理者ゲスト'
      user.admin = true
    end
  end
end
