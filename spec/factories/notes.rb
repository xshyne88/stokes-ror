FactoryBot.define do
  factory :note do
    body { Faker::Quote.yoda }
    noteable { nil }
  end
end
