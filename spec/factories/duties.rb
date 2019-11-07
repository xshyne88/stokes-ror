FactoryBot.define do
  factory :duty do
    name { Faker::FunnyName.name }
    description { "My Description" }
    completed_at { false }
  end
end
