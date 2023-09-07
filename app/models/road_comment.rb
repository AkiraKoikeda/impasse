# frozen_string_literal: true

class RoadComment < ApplicationRecord
  belongs_to :user
  belongs_to :road

  validates :comment, presence: true
end
