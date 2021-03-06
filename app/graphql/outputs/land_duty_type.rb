module Outputs
  class LandDutyType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :name, String, null: false
    field :land, Outputs::LandType, null: true
    field :duty, Outputs::DutyType, null: true
    field :estimated_days, Integer, null: true
    field :status, String, null: true
    field :expires_at, GraphQL::Types::ISO8601DateTime, null: true
    field :completed_duties, Outputs::CompletedDutyType.connection_type, null: true
    field :active_completed_duty, Outputs::CompletedDutyType, null: true
    field :completed_by, String, null: true
    field :notes, Outputs::NoteType.connection_type, null: true

    def estimated_days
      @object.estimated_days
    end

    def active_completed_duty
      Loaders::AssociationLoader.for(LandDuty, :completed_duties).load(@object).then do |cd|
        result = cd.detect { |c| !c.expired? }
        result || nil
      end
    end

    def duty
      Loaders::AssociationLoader.for(LandDuty, :duty).load(@object)
    end

    def land
      Loaders::AssociationLoader.for(LandDuty, :land).load(@object)
    end

    def completed_duties
      Loaders::AssociationLoader.for(LandDuty, :completed_duties).load(@object)
    end

    def notes
      Loaders::AssociationLoader.for(LandDuty, :notes).load(@object)
    end

    def self.loads(id)
      LandDuty.find(id)
    end
  end
end
