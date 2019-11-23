class Land < ApplicationRecord
  audited
  has_associated_audits

  validates :name, presence: true, uniqueness: true

  has_many :land_duties, -> { order(created_at: :desc) }
  has_many :duties, -> { order('land_duties.sort', :desc) }, through: :land_duties
  has_many :completed_duties, -> { order(created_at: :desc) }
  has_many :notes, as: :noteable, dependent: :destroy

  def assign_land_duties(dutys)
    self.duties=dutys
  end
end
