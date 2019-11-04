module Mutations
  class CreateUserMutation < Types::BaseMutation
    description "Create a user"

    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Outputs::UserType, null: true
    field :errors, function: Resolvers::Error.new

    policy ApplicationPolicy, :admin?

    def authorized_resolve
      user = User.new(input.to_h)

      if user.save
        {user: user, errors: []}
      else
        {user: nil, errors: user.errors}
      end
    end
  end
end
