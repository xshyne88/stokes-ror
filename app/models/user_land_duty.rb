class UserLandDuty < ApplicationRecord
  belongs_to :user
  belongs_to :land
  belongs_to :duty
end
