module Types
  class QueryType < Types::BaseObject
    field :lands, resolver: Queries::LandsQuery
    # field :land, resolver: LandQuery
    # field :user, resolver: UserQuery
    # field :search_lands, resolver: SearchLandsQuery
  end
end
