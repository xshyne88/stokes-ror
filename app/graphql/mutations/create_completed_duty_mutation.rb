module Mutations
  class CreateCompletedDutyMutation < Types::BaseMutation
    description "Create a CompletedDuty"

    argument :land_duty_id, ID, required: true, loads: Outputs::LandDutyType
    argument :user_id, ID, required: true, loads: Outputs::UserType
    argument :completed_at, GraphQL::Types::ISO8601DateTime, required: false

    field :completed_duty, Outputs::CompletedDutyType, null: true
    field :errors, function: Resolvers::Error.new
    field :land, Outputs::LandType, null: true

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      completed_duty = CompletedDuty.new(input.to_h)

      if completed_duty.save
        {completed_duty: completed_duty, errors: [], land: completed_duty.reload.land_duty.reload.land.reload}
      else
        {completed_duty: nil, errors: completed_duty.errors, land: nil}
      end
    end
  end
end
