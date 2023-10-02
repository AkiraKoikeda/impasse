FactoryBot.define do
  factory :road do
    association :user
    address { Faker::Lorem.characters(number:20) }
    car_model { Faker::Lorem.characters(number:5) }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    situation { Faker::Lorem.characters(number:30) }
    star { Faker::Number.number(digits: 1) }
  end
end