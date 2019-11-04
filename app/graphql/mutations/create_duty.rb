module Mutations
  class CreateDuty < Types::BaseMutation
    description "Create a duty"

    argument :name, String, required: true
    argument :description, String, required: true

    field :duty, Outputs::DutyType, null: true
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      duty = Duty.new(input.to_h)

      if duty.save
        {duty: duty, errors: []}
      else
        {duty: nil, errors: duty.errors}
      end
    end
  end
end
