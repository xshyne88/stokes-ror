module Queries
  class LandsQuery < Types::BaseResolver
    description "get all lands"
    type Outputs::LandType.connection_type, null: false

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      Land.order(name: :asc).all
    end
  end
end
