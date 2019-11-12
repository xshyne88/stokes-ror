class Land < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :land_duties, :dependent => :destroy
  has_many :notes, as: :noteable, :dependent => :destroy

  audited
  has_associated_audits

  def self.foo
    LandScheduler.run
  end
end
