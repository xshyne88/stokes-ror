module Mutations
  class AssignLandDutiesMutation < Types::BaseMutation
    description "bulk edits land duties on  a land"

    argument :duty_ids, [ID], required: true
    argument :land_id, ID, required: true, loads: Outputs::LandType

    field :land, Outputs::LandType, null: true
    field :errors, function: Resolvers::Error.new, null: false

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      result = input.land.assign_land_duties(decode_duty_ids(input.duty_ids))
      if result
        {land: input.land.reload, errors: []}
      else
        {user: nil, errors: ["Land failed to update"]}
      end
    end

    private
 
    def decode_duty_ids(ids)
      ids.map do |id|
        GraphQL::Schema::UniqueWithinType.decode(id).second.to_i
      end
    end
  end
end
