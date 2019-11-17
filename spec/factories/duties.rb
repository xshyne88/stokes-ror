FactoryBot.define do
  factory :duty do
    name { Faker::Company.unique.bs }
    description { Faker::Quote.famous_last_words }
  end
end
