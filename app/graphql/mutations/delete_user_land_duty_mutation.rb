module Mutations
  class DeleteUserLandDutyMutation < Types::BaseMutation
    description "Delete a UserLandDuty"

    argument :user_land_duty_id, ID, required: true, loads: Outputs::LandDutyType

    field :success, Boolean, null: false
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      if input.user_land_duty.destroy
        {success: true, errors: []}
      else
        {success: false, errors: user_land_duty.errors}
      end
    end
  end
end
