module GraphQLHelpers
  def execute(query, context: {}, variables: {})
    context[:current_user] = as unless context.key?(:current_user)
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
