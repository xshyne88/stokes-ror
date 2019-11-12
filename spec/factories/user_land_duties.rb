FactoryBot.define do
  factory :user_land_duty do
    user
    land_duty
    completed_at { nil }
  end
end
