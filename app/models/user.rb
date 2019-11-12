class User < ApplicationRecord
  has_paper_trail

  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 8}, allow_nil: true

  has_many :user_land_duties
  has_many :notes, as: :noteable

  scope :active, -> { where(active: true) }

  has_secure_password

  def update_password(current:, new:)
    if authenticate(current)
      update(password: new)
    else
      false
    end
  end

  def suspend
    update(active: false)
  end

  def guest?
    false
  end
end
