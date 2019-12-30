module Mutations
  module Inputs
    class CompletedDuty < Types::BaseInputObject
      graphql_name "CompletedDutyInput"
      description "Properties for a Completed Duty"

      argument :expired, Boolean, required: false
      argument :expires_at, GraphQL::Types::ISO8601DateTime, required: false
    end
  end
end
