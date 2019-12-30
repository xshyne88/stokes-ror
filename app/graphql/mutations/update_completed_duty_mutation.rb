module Mutations
  class UpdateCompletedDutyMutation < Types::BaseMutation
    description "Updates a completed duty"

    argument :completed_duty_id, ID, required: true, loads: Outputs::CompletedDutyType
    argument :completed_duty_input, Inputs::CompletedDuty, required: true

    field :completed_duty, Outputs::CompletedDutyType, null: true
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      return before_now_error if input.completed_duty_input["expiresAt"] < DateTime.now

      if input.completed_duty.update(input.completed_duty_input.to_h)
        {completed_duty: input.completed_duty, errors: []}
      else
        {completed_duty: nil, errors: input.completed_duty.errors}
      end
    end

    private

    def before_now_error
      {completed_duty: nil, errors: ["cant set update time before now"]}
    end

  end
end
