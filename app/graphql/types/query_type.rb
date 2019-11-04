module Types
  class QueryType < Types::BaseObject
    field :lands, resolver: Queries::Lands
    field :land, resolver: Queries::Land
    field :duty, resolver: Queries::Duty
    field :duties, resolver: Queries::Duties
    # field :user, resolver: UserQuery
    # field :search_lands, resolver: SearchLandsQuery
  end
end
