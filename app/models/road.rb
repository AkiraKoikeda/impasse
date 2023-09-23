# frozen_string_literal: true

class Road < ApplicationRecord
  has_one_attached :image

  belongs_to :user
  has_many :road_comments, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  validates :address, presence: true
  validates :lat, presence: true, numericality: true
  validates :lng, presence: true, numericality: true
  validates :star, presence: true
  validates :car_model, presence: true, length: { in: 2..20 }
  validates :situation, presence: true, length: { in: 6..250 }
end
