class Land < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :land_duties
  has_many :user_land_duties
  has_many :notes, as: :noteable

  has_paper_trail

  def self.foo
    LandScheduler.run
  end
end
