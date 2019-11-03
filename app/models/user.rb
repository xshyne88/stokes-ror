class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, length: {minimum: 8}, allow_nil: true

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
