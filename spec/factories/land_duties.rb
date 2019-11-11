FactoryBot.define do
  factory :land_duty do
    land
    duty
    estimated_days { 14 }
    completed_at { DateTime.now }
  end
end
