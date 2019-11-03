class User < ApplicationRecord
  # def update_password(current:, new:)
  #   if authenticate(current)
  #     update(password: new)
  #   else
  #     false
  #   end
  # end

  # def suspend
  #   update(active: false)
  # end

  def guest?
    false
  end
end
