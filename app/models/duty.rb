class Duty < ApplicationRecord
  has_many :land_duties, dependent: :destroy
  has_many :completed_duties, dependent: :destroy

  has_many :notes, as: :noteable
  has_one :land, class_name: 'Land', foreign_key: 'last_completed_duty_id'
end
