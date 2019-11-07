module Queries
  class LandsQuery < Types::BaseResolver
    description "get all lands"
    type Outputs::LandType.connection_type, null: false

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      Land.all
    end
  end
end
