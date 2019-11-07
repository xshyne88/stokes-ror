module Queries
  class LandQuery < Types::BaseResolver
    description "gets a single land by id"
    type Outputs::LandType, null: false
    argument :land_id, ID, required: true, loads: Outputs::LandType
    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      input.land
    end
  end
end
