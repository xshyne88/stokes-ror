class LandDuty < ApplicationRecord
  after_commit :update_land_last_completed, on: :update
  enum status: {incomplete: 0, completed: 1}

  audited associated_with: :land
  has_associated_audits

  has_many :completed_duties

  belongs_to :land
  belongs_to :duty

  private

  def update_land_last_completed
    land.update(last_completed_duty: duty.name)
  end
end
