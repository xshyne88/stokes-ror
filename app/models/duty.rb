class Duty < ApplicationRecord
  has_many :land_duties
  has_many :completed_duties

  has_many :notes, as: :noteable
end
