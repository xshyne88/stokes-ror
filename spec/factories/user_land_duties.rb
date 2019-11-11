FactoryBot.define do
  factory :user_land_duty do
    user
    land
    duty
    estimated_days { 14 }
    completed_at { DateTime.now }
  end
end
