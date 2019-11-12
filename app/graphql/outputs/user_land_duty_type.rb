module Outputs
  class UserLandDutyType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :user, Outputs::UserType, null: true
    field :land_duty, Outputs::LandDutyType, null: true
    field :completed_at, GraphQL::Types::ISO8601DateTime, null: true

    def land_duty
      Loaders::AssociationLoader.for(UserLandDuty, :land_duty).load(@object)
    end

    def user
      Loaders::AssociationLoader.for(UserLandDuty, :user).load(@object)
    end

    def self.loads(id)
      UserLandDuty.find(id)
    end
  end
end
