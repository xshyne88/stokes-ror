module Mutations
  class CreateLandDutyMutation < Types::BaseMutation
    description "Create a LandDuty"

    argument :land_id, ID, required: true, loads: Outputs::LandType
    argument :duty_id, ID, required: true, loads: Outputs::DutyType
    argument :estimated_days, Integer, required: false
    argument :completed_at, GraphQL::Types::ISO8601DateTime, required: false

    field :land_duty, Outputs::LandDutyType, null: true
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      pp input
      land_duty = LandDuty.new(input.to_h)

      if land_duty.save
        {land_duty: land_duty, errors: []}
      else
        {land_duty: nil, errors: land_duty.errors}
      end
    end
  end
end
