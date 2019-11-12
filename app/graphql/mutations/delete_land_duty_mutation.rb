module Mutations
  class DeleteLandDutyMutation < Types::BaseMutation
    description "Delete a LandDuty"

    argument :land_duty_id, ID, required: true, loads: Outputs::LandDutyType

    field :success, Boolean, null: false
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      if input.land_duty.destroy
        {success: true, errors: []}
      else
        {success: false, errors: land_duty.errors}
      end
    end
  end
end
