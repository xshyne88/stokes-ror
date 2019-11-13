module Mutations
  class DeleteUserLandDutyMutation < Types::BaseMutation
    description "Delete a UserLandDuty"

    argument :user_land_duty_id, ID, required: true, loads: Outputs::LandDutyType

    field :user_land_duty, Outputs::UserLandDutyType, null: true
    field :success, Boolean, null: false
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      if input.user_land_duty.destroy
        {user_land_duty: input.user_land_duty, success: true, errors: []}
      else
        {user_land_duty: nil, success: false, errors: user_land_duty.errors}
      end
    end
  end
end
