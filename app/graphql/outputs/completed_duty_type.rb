module Outputs
  class CompletedDutyType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :user, Outputs::UserType, null: true
    field :land_duty, Outputs::LandDutyType, null: true
    field :expires_at, GraphQL::Types::ISO8601DateTime, null: true
    field :expired, Boolean, null: true
    field :last_completed_by, String, null: true

    def last_completed_by
      Loaders::AssociationLoader.for(CompletedDuty, :land_duty).load(@object) do |land_duty|
      @object.last_completed_by
    end

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
