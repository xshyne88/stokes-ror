class CompletedDuty < ApplicationRecord
  include Orderable

  after_commit :denormalize_land_duty_complete, on: :create
  after_commit :denormalize_land_duty_incomplete, on: :destroy

  audited associated_with: :land_duty
  acts_as_paranoid

  belongs_to :user
  belongs_to :land_duty

  before_create :set_expires_at

  scope :active, -> { where(expired: false) }
  scope :most_recent, -> { order("created_at DESC").limit(5) }

  has_many :notes, as: :noteable
  has_many :verified_completed_duties

  def mark_expired
    update(expired: true)
  end

  def most_recent_one
    land_duty.completed_duties.most_recent.first
  end

  def most_recent_user_to_complete
    land_duty.completed_duties.most_recent.first.user
  end

  private

  def set_expires_at
    return unless expires_at.nil?

    self.expires_at = DateTime.now + land_duty.duty.estimated_days
  end

  def denormalize_land_duty_complete
    land_duty.update(status: :completed, last_completed_by: audits.last.user)
  end

  def denormalize_land_duty_incomplete
    return if expired?
    land_duty.update(status: :incomplete, last_completed_by: last_completed_by)
  end
end
