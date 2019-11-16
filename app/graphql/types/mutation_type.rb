module Types
  class MutationType < Types::BaseObject
    # CREATE
    field :create_duty, mutation: Mutations::CreateDuty
    field :create_user, resolver: Mutations::CreateUserMutation
    field :create_land_duty, resolver: Mutations::CreateLandDutyMutation
    field :create_completed_duty, resolver: Mutations::CreateCompletedDutyMutation

    # UPDATE
    field :update_password, resolver: Mutations::UpdatePasswordMutation
    field :update_land_duty, resolver: Mutations::UpdateLandDutyMutation

    field :assign_land_duties, resolver: Mutations::AssignLandDutiesMutation

    # DELETE

    field :delete_completed_duty, resolver: Mutations::DeleteCompletedDutyMutation
    field :delete_land_duty, resolver: Mutations::DeleteLandDutyMutation

    # AUTH

    field :sign_in_user, resolver: Mutations::SignInUserMutation
    field :refresh_tokens, resolver: Mutations::RefreshTokensMutation
    # field :send_reset_password, resolver: SendResetPasswordMutation
    # field :reset_password, resolver: ResetPasswordMutation
    # field :suspend_user, resolver: SuspendUserMutation
  end
end
