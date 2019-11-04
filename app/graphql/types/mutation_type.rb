module Types
  class MutationType < Types::BaseObject
    field :create_duty, mutation: Mutations::CreateDuty
    field :sign_in_user, resolver: Mutations::SignInUserMutation
    field :refresh_tokens, resolver: Mutations::RefreshTokensMutation
    field :update_password, resolver: Mutations::UpdatePasswordMutation
    field :create_user, resolver: Mutations::CreateUserMutation
    # field :send_reset_password, resolver: SendResetPasswordMutation
    # field :reset_password, resolver: ResetPasswordMutation
    # field :suspend_user, resolver: SuspendUserMutation
  end
end
