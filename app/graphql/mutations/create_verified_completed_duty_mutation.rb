module Mutations
  class CreateVerifiedCompletedDutyMutation < Types::BaseMutation
    description "Create a VerifiedCompletedDuty"

    argument :completed_duty_id, ID, required: true, loads: Outputs::CompletedDutyType
    argument :extension, Integer, required: true

    field :verified_completed_duty, Outputs::VerifiedCompletedDutyType, null: true
    field :errors, function: Resolvers::Error.new
    field :land, Outputs::LandType, null: true

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      vcd = VerifiedCompletedDuty.new(input.to_h.merge(user: current_user))

      if vcd.save
        {verified_completed_duty: vcd,
         errors: [],
         land: vcd.completed_duty.reload.land_duty.land
          }
      else
        {verified_completed_duty: nil, errors: vcd.errors, land: nil}
      end
    end
  end
end