class RoadComment < ApplicationRecord
  belongs_to :user
  belongs_to :road
end
