module Queries
  class DutyQuery < Types::BaseResolver
    description "A single duty by ID"
    type Outputs::DutyType, null: false
    argument :duty_id, ID, required: true, loads: Outputs::DutyType
    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      input.duty
    end
  end
end
