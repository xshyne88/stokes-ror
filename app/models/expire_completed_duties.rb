class ExpireCompletedDuties < ApplicationRecord
  def initialize(user)
    @user = user
  end

  def call
    CompletedDuty.where()

  end

end
