class LandDuty < ApplicationRecord
  enum status: {incomplete: 0, completed: 1}

  audited associated_with: :land
  has_associated_audits
  acts_as_paranoid

  has_many :completed_duties, -> { order(created_at: :desc) }
  has_many :notes, as: :noteable, dependent: :restrict_with_error

  belongs_to :land
  belongs_to :duty

  scope :active, -> { where(expired: false) }

  def has_any_completions?
   completed_duties.count > 0
  end

  private

  def update_land_last_completed
    land.update(last_completed_duty: completed_duties.first)
  end
end
