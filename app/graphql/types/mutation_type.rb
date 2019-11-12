module Types
  class MutationType < Types::BaseObject
    field :create_duty, mutation: Mutations::CreateDuty
    field :sign_in_user, resolver: Mutations::SignInUserMutation
    field :refresh_tokens, resolver: Mutations::RefreshTokensMutation
    field :update_password, resolver: Mutations::UpdatePasswordMutation
    field :create_user, resolver: Mutations::CreateUserMutation
    field :create_land_duty, resolver: Mutations::CreateLandDutyMutation
    field :create_user_land_duty, resolver: Mutations::CreateUserLandDutyMutation
    field :delete_user_land_duty, resolver: Mutations::DeleteUserLandDutyMutation
    field :delete_land_duty, resolver: Mutations::DeleteLandDutyMutation
    # field :send_reset_password, resolver: SendResetPasswordMutation
    # field :reset_password, resolver: ResetPasswordMutation
    # field :suspend_user, resolver: SuspendUserMutation
  end
end
