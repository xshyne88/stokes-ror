module Mutations
  class DeleteLandDutyMutation < Types::BaseMutation
    description "Delete a LandDuty"

    argument :land_duty_id, ID, required: true, loads: Outputs::LandDutyType

    field :success, Boolean, null: false
    field :land, Outputs::LandType, null: false
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      pp land = input.land_duty.land
      if input.land_duty.destroy
        pp land.land_duties
        {success: true, errors: [], land: land.reload}
      else
        {success: false, errors: input.land_duty.errors, land: nil}
      end
    end
  end
end
