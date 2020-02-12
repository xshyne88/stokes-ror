module Mutations
  module Inputs
    class Duty < Types::BaseInputObject
      graphql_name "DutyInput"
      description "Properties for a Duty"
      argument :name, String, required: false
      argument :icon, String, required: false
      argument :estimated_days, Integer, required: false
    end
  end
end
