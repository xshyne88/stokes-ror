class Duty < ApplicationRecord
  has_many :land_duties, dependent: :destroy
  has_many :completed_duties, dependent: :destroy

  has_many :notes, as: :noteable
end
