class LandDuty < ApplicationRecord
  has_many :user_land_duties
  
  belongs_to :land
  belongs_to :duty
end
