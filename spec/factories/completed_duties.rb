FactoryBot.define do
  factory :completed_duty do
    user
    land_duty
    completed_at { nil }
  end
end
