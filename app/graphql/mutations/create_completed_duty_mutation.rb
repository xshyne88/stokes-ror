module Mutations
  class CreateCompletedDutyMutation < Types::BaseMutation
    description "Create a CompletedDuty"

    argument :land_duty_id, ID, required: true, loads: Outputs::LandDutyType
    argument :user_id, ID, required: true, loads: Outputs::UserType
    argument :completed_at, GraphQL::Types::ISO8601DateTime, required: false

    field :completed_duty, Outputs::CompletedDutyType, null: true
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      land_duty = CompletedDuty.new(input.to_h)

      if land_duty.save
        {completed_duty: land_duty, errors: []}
      else
        {completed_duty: nil, errors: land_duty.errors}
      end
    end
  end
end
