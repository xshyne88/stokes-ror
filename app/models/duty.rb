class Duty < ApplicationRecord
  has_many :land_duties
  has_many :user_land_duties

  def mark_complete
    update(completed_at: DateTime.now)
  end

  def completed?
    !completed_at.nil?
  end
end
