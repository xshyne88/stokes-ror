class UserLandDuty < ApplicationRecord
  audited associated_with: :land_duty

  belongs_to :user
  belongs_to :land_duty

  has_many :notes, as: :noteable

  def mark_complete
    update(completed_at: DateTime.now)
  end

  def completed?
    !completed_at.nil?
  end
end
