module Mutations
  module Inputs
    class LandDuty < Types::BaseInputObject
        graphql_name "LandDutyInput"
        description "Properties for a Land Duty"
        argument :land_id, ID, required: false
        argument :duty, ID, required: false
        argument :estimated_days, Integer, required: false
        argument :completed_at, GraphQL::Types::ISO8601DateTime, required: false
         
    end
  end
end
