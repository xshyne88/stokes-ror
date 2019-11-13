module Mutations
  class CreateUserLandDutyMutation < Types::BaseMutation
    description "Create a UserLandDuty"

    argument :land_duty_id, ID, required: true, loads: Outputs::LandDutyType
    argument :user_id, ID, required: true, loads: Outputs::UserType
    argument :completed_at, GraphQL::Types::ISO8601DateTime, required: false

    field :user_land_duty, Outputs::UserLandDutyType, null: true
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      land_duty = UserLandDuty.new(input.to_h)

      if land_duty.save
        {user_land_duty: land_duty, errors: []}
      else
        {user_land_duty: nil, errors: land_duty.errors}
      end
    end
  end
end
