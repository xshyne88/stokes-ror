module Outputs
  class LandType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :name, String, null: false
    field :longitude, String, null: true
    field :latitude, String, null: true
    field :land_duties, Outputs::LandDutyType.connection_type, null: true

    def land_duties
      Loaders::AssociationLoader.for(Land, :land_duties).load(@object)
    end

    def duties
      Loaders::AssociationLoader.for(Land, :land_duties).load(@object)
    end

    def self.loads(id)
      Land.find(id)
    end
  end
end
