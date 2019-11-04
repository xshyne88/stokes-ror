require "rails_helper"

describe "Create User Mutation", :graphql do
  describe "createUser" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: CreateUserInput!) {
          createUser(input: $input) {
            user {
              email
              }
            }
          }
      GRAPHQL
    end

    it "creates a new user" do
      user_email = "example@test.com"
      user_password = "abc12345"
      current_user = create(:user, :admin)

      result = execute query, as: current_user, variables: {
        input: {
          email: user_email,
          password: user_password
        },
      }

      create_user = result[:data][:createUser]
      email = create_user[:user][:email]
      expect(User.count).to eq(2)
      expect(email).to eq(user_email)
    end
  end
end
