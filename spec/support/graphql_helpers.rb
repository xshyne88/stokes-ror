module GraphQLHelpers
  def execute(query, context: {}, variables: {})
    StokesGraveyardSchema.execute(
      query,
      variables: variables.with_indifferent_access,
      context: context
    ).with_indifferent_access
  end

  def global_id(record, type)
    GraphQL::Schema::UniqueWithinType.encode(type.graphql_name, record.id)
  end
end
