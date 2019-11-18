FactoryBot.define do
  factory :land do
    name { Faker::Address.unique.state }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
