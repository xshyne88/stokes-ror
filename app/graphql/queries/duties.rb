module Queries
  class Duties < Types::BaseResolver
    description "query for a single duty by ID"
    type Outputs::DutyType.connection_type, null: false

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      Duty.all
    end
  end
end
