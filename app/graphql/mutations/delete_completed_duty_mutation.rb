module Mutations
  class DeleteCompletedDutyMutation < Types::BaseMutation
    description "Delete a CompletedDuty"

    argument :completed_duty_id, ID, required: true, loads: Outputs::LandDutyType

    field :completed_duty, Outputs::CompletedDutyType, null: true
    field :success, Boolean, null: false
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      if input.completed_duty.destroy
        {completed_duty: input.completed_duty, success: true, errors: []}
      else
        {completed_duty: nil, success: false, errors: completed_duty.errors}
      end
    end
  end
end
