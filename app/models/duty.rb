class Duty < ApplicationRecord
  has_many :land_duties
  has_many :user_land_duties

end
