class Duty < ApplicationRecord
  def mark_complete
    update(completed_at: DateTime.now)
  end

  def completed?
    !completed_at.nil?
  end
end
