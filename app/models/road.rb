class Road < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :road_comments, dependent: :destroy


end
