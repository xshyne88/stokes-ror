module Outputs
  class CompletedDutyType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :user, Outputs::UserType, null: true
    field :land_duty, Outputs::LandDutyType, null: true
    field :completed_at, GraphQL::Types::ISO8601DateTime, null: true

    def land_duty
      Loaders::AssociationLoader.for(CompletedDuty, :land_duty).load(@object)
    end

    def user
      Loaders::AssociationLoader.for(CompletedDuty, :user).load(@object)
    end

    def self.loads(id)
      CompletedDuty.find(id)
    end
  end
end
