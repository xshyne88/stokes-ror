class LandDuty < ApplicationRecord
  has_many :user_land_duties

  belongs_to :land
  belongs_to :duty

  before_create :set_expires_at

  private

  def set_expires_at
    return if !expires_at.nil?

    self.expires_at = DateTime.now + estimated_days
  end
end
