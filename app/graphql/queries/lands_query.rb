module Queries
  class LandsQuery < Types::BaseResolver
    type Outputs::LandType.connection_type, null: false
    policy ApplicationPolicy, :admin?

    def resolve
      Land.all
    end
  end
end
