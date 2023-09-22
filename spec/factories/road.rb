FactoryBot.define do
  factory :road do
    association :user
    address { Faker::Lorem.characters(number:20) }
    lat { Faker::Address.latitude }
    lng { Faker::Address.longitude }
    car_model { Faker::Vehicle.car_type }
    situation { Faker::Lorem.characters(number:30) }
    star { Faker::Number.number(digits: 10) }
  end
end 