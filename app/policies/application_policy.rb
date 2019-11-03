class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def logged_in?
    !user.guest?
  end

  def admin?
    pp "CHJECKING IF USER IS ADMIn"
    user.admin?
  end
end
