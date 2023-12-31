FactoryBot.define do
  factory :road do
    association :user
    address { Faker::Lorem.characters(number:20) }
    lat { Faker::Lorem.characters(number:10) }
    lng { Faker::Lorem.characters(number:10) }
    car_model { Faker::Lorem.characters(number:1) }
    situation { Faker::Lorem.characters(number:30) }
    star { Faker::Number.number(digits: 10) }
  end
end