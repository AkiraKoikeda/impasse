class Road < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :road_comments, dependent: :destroy

  geocoded_by :address
  after_validation :geocode
end
