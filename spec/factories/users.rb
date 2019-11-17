FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::TvShows::Seinfeld.character }
    password { Faker::Internet.password }

    trait :admin do
      admin { true }
    end

    trait :active do
      active { true }
    end

    trait :suspended do
      active { false }
    end
  end
end
