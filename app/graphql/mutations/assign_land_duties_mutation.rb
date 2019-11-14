module Mutations
  class AssignLandDutiesMutation < Types::BaseMutation
    description "bulk edits land duties on  a land"

    argument :duty_ids, [ID], required: true, loads: Outputs::DutyType
    argument :land_id, ID, required: true, loads: Outputs::LandType

    field :land, Outputs::LandType, null: true
    field :errors, function: Resolvers::Error.new, null: false

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      input.land.duties = input.dutys

      {land: input.land.reload, errors: []}
    end

    private
 
    def decode_duty_ids(ids)
      ids.map do |id|
        GraphQL::Schema::UniqueWithinType.decode(id).second.to_i
      end
    end
  end
end
