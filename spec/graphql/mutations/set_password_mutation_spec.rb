require "rails_helper"

describe "Set Password Mutation API", :graphql do
  describe "setPassword" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: SetPasswordInput!) {
          setPassword(input: $input) {
            user {
              id
            }
            errors {
              field
            }
          }
        }
      GRAPHQL
    end

    it "sets a users password if the current password is correct" do
      user = create(:user, password: "current_password")

      result = execute query, as: user, variables: {
        input: {
          userId: global_id(user, Outputs::UserType),
          newPassword: "new_password",
        },
      }

      expect(result[:data][:setPassword][:errors]).to be_empty
    end
  end
end
