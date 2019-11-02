module Outputs
  class LandType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :name, String, null: false

    def self.loads(id)
      Land.find(id)
    end
  end
end
