module Types
  class CompletedDutySortByType < Types::BaseEnum
    graphql_name "CompletedDutySortByType"
    description "Possible columns to sort duties by"
    value "USER", value: :user
    value "CREATED_AT", value: :created_at
    value "LAND_DUTY", value: :land_duty
    value "EXPIRES_AT", value: :expires_at
    value "EXPIRED", value: :expired
  end
end
