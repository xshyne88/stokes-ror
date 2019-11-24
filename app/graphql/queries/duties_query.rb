module Queries
  class DutiesQuery < Types::BaseResolver
    description "fetch all duties"
    type Outputs::DutyType.connection_type, null: false

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      Duty.order(name: :asc).all
    end
  end
end
