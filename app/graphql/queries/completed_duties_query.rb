module Queries
  class CompletedDutiesQuery < Types::BaseResolver
    argument :sort_by,
      Types::CompletedDutySortByType,
      "The column to sort the results by",
      default_value: :expires_at,
      required: false
    argument :sort_direction,
      Types::SortDirectionType,
      "The direction to sort the results",
      default_value: :asc,
      required: false
    description "fetch all completedDuties"
    type Outputs::CompletedDutyType.connection_type, null: false

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      CompletedDuty.order_by(input.sort_by, input.sort_direction)
    end
  end
end
