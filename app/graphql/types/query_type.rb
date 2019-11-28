module Types
  class QueryType < Types::BaseObject
    field :lands, resolver: Queries::LandsQuery
    field :land, resolver: Queries::LandQuery
    field :duty, resolver: Queries::DutyQuery
    field :duties, resolver: Queries::DutiesQuery
    field :completedDuties, resolver: Queries::CompletedDutiesQuery
    field :users, resolver: Queries::UsersQuery
    # field :user, resolver: UserQuery
    # field :search_lands, resolver: SearchLandsQuery
  end
end
