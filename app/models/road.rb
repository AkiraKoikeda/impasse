class Road < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :road_comments, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  validates :address, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :star, presence: true
  validates :car_model, presence: true
  validates :situation, presence: true
end
