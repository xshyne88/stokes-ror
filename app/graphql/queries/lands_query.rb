module Queries
  class LandsQuery < Types::BaseResolver
    description "query for a single land by ID"
    type Outputs::LandType.connection_type, null: false

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      Land.all
    end
  end
end
