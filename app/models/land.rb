class Land < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :land_duties
  has_many :user_land_duties
  has_many :notes, as: :noteable

  def assign_land_duties(duty_ids)
    old_duty_ids = land_duties.map { |ld| ld.duty.id }
    LandDuty.where(land: self, duty_id: (old_duty_ids - duty_ids))
      .destroy_all
    (duty_ids - old_duty_ids).each { |d| LandDuty.find_or_create_by(land:self, duty_id: d) }
  end
end
