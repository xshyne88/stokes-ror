module Queries
  class LandQuery < Types::BaseResolver
    description "Gets all the lands"
    type Outputs::LandType, null: false
    argument :land_id, ID, required: true, loads: Outputs::LandType
    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      input.land
    end
  end
end
