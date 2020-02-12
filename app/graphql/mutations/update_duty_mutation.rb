module Mutations
  class UpdateDutyMutation < Types::BaseMutation
    description "Updates a duty"

    argument :duty_id, ID, required: true, loads: Outputs::DutyType
    argument :duty_input, Inputs::Duty, required: true

    field :duty, Outputs::DutyType, null: true
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      if input.duty.update(input.duty_input.to_h)
        {duty: input.duty.reload, errors: []}
      else
        {duty: nil, errors: input.duty.errors}
      end
    end
  end
end
