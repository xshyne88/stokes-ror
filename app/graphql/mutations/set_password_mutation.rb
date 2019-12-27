module Mutations
  class SetPasswordMutation < Types::BaseMutation
    description "Sets the password of the current user"

    argument :user_id, ID, required: true, loads: Outputs::UserType
    argument :new_password, String, required: true

    field :user, Outputs::UserType, null: true
    field :errors, function: Resolvers::Error.new, null: false

    policy ApplicationPolicy, :logged_in?

    def authorized_resolve
      input.user.password = input.new_password
      input.user.password_confirmation = input.new_password
      if input.user.save
        {user: input.user, errors: []}
      else
        {user: nil, errors: ["Password failed to set"]}
      end
    end
  end
end
