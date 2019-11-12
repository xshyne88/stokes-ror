class UserLandDuty < ApplicationRecord
  belongs_to :user
  belongs_to :land_duty

  def mark_complete
    update(completed_at: DateTime.now)
  end

  def completed?
    !completed_at.nil?
  end
end
