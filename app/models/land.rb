class Land < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :land_duties
  has_many :duties, through: :land_duties
  has_many :user_land_duties
  has_many :notes, as: :noteable

  def assign_land_duties(dutys)
    self.duties=dutys
  end
end
