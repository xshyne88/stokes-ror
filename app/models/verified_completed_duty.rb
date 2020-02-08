class VerifiedCompletedDuty < ApplicationRecord
  require 'date'
  after_commit :extend_completed_duty_expiration, on: :create

  belongs_to :user
  belongs_to :completed_duty

  def extend_completed_duty_expiration
    completed_duty.update(expires_at: completed_duty.expires_at + extension.days)
  end
end
