module Outputs
  class LandType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :name, String, null: false
  end
end
