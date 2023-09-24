# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :roads, dependent: :destroy
  has_many :road_comments, dependent: :destroy

  validates :name, presence: true, length: { in: 2..10 }, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def self.guest
    find_or_create_by!(email: "guest@example.com", name: "ゲスト") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
