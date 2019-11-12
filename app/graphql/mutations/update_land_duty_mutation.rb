module Mutations
  class UpdateLandDutyMutation < Types::BaseMutation
    description "Updates a land duty"

    argument :land_duty_id, ID, required: true, loads: Outputs::LandDutyType
    argument :land_duty_input, Inputs::LandDuty, required: true

    field :land_duty, Outputs::LandDutyType, null: true
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      if input.land_duty.update(input.land_duty_input.to_h)
        {land_duty: input.land_duty, errors: []}
      else
        {land_duty: nil, errors: input.land_duty.errors}
      end
    end
  end
end
