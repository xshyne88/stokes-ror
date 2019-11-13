module Outputs
  class LandDutyType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :name, String, null: false
    field :land, Outputs::LandType, null: true
    field :duty, Outputs::DutyType, null: true
    field :estimated_days, Integer, null: true
    field :completed_at, GraphQL::Types::ISO8601DateTime, null: true
    field :user_land_duties, Outputs::UserLandDutyType, null: true

    def estimated_days
      @object.estimated_days
    end

    def user
      Loaders::AssociationLoader.for(LandDuty, :user).load(@object)
    end

    def land
      Loaders::AssociationLoader.for(LandDuty, :land).load(@object)
    end

    def user_land_duties
      Loaders::AssociationLoader.for(LandDuty, :user_land_duties).load(@object)
    end

    def self.loads(id)
      LandDuty.find(id)
    end
  end
end
