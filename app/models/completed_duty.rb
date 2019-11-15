class CompletedDuty < ApplicationRecord
  after_commit :update_land_duty_c, on: :create
  after_commit :update_land_duty_ic, on: :destroy

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

  private 

  # TODO: where expired at has not occured
  def update_land_duty_c
    land_duty.update(status: :completed)
  end 

  # TODO: where expired at has not occured
  def update_land_duty_ic
    land_duty.update(status: :incomplete)
  end 
end
