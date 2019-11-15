class Land < ApplicationRecord
  audited
  has_associated_audits

  validates :name, presence: true, uniqueness: true

  has_many :land_duties
  has_many :duties, through: :land_duties
  has_many :completed_duties
  has_many :notes, as: :noteable, dependent: :destroy

  def assign_land_duties(dutys)
    self.duties=dutys
  end
end
