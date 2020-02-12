module Outputs
  class DutyType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :name, String, null: false
    field :description, String, null: false
    field :estimated_days, Integer, null: false

    def self.loads(id)
      Duty.find(id)
    end
  end
end
