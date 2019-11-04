module Outputs
  class DutyType < Types::BaseObject
    implements Types::ActiveRecord

    global_id_field :id
    field :name, String, null: false
    field :description, String, null: false
    field :completed_at, GraphQL::Types::ISO8601DateTime, null: true

    def self.loads(id)
      Duty.find(id)
    end
  end
end
