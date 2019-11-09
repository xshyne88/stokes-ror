module Outputs
  class LandType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :name, String, null: false
    field :longitude, String, null: true
    field :latitude, String, null: true

    def self.loads(id)
      Land.find(id)
    end
  end
end
