require "rails_helper"

describe "Users Query", :graphql do
  describe "users" do
    query = <<~'GRAPHQL'
      query {
        users {
          edges {
            node {
              email
            }
          }
        }
      }
    GRAPHQL

    it "returns a list of users" do
      user = create(:user)

      result = execute query, as: build(:user)

      users_result = result[:data][:users][:edges].pluck(:node)
      expect(users_result).to include(email: user.email)
    end
  end
end
