module Mutations
  class CreateLandDutyMutation < Types::BaseMutation
    description "Create a LandDuty"

    argument :land_id, ID, required: true, loads: Outputs::LandType
    argument :duty_id, ID, required: true, loads: Outputs::DutyType
    argument :estimated_days, Integer, required: false
    argument :expires_at, GraphQL::Types::ISO8601DateTime, required: false

    field :land_duty, Outputs::LandDutyType, null: true
    field :land, Outputs::LandType, null: true
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      land_duty = LandDuty.new(input.to_h)
      land = land_duty.land

      if land_duty.save
        {land_duty: land_duty, errors: [], land: land.reload}
      else
        {land_duty: nil, errors: land_duty.errors, land: nil}
      end
    end
  end
end
