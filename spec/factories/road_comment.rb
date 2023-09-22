FactoryBot.define do
  factory :road_comment do
    association :user
    association :road
    comment { Faker::Lorem.characters(number:20) }
  end
end
