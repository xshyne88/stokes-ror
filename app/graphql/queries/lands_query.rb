module Queries
  class LandsQuery < Types::BaseResolver
    type Outputs::LandType.connection_type, null: false

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      Land.all
    end
  end
end
