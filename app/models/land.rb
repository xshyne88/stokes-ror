class Land < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
