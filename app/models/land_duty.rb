class LandDuty < ApplicationRecord
  after_commit :update_land_last_completed, on: :update
  enum status: {incomplete: 0, complete: 1}

  audited associated_with: :land
  has_associated_audits

  has_many :completed_duties, dependent: :destroy

  belongs_to :land
  belongs_to :duty

  before_create :set_expires_at

  private

  def set_expires_at
    return if !expires_at.nil?

    self.expires_at = DateTime.now + estimated_days
  end

  def update_land_last_completed
    land.update(last_completed_duty: duty.name)
  end
end
