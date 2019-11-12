require "rails_helper"

describe "Create UserLandDuty Mutation", :graphql do
  describe "createUserLandDuty" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: CreateUserLandDutyInput!) {
          createUserLandDuty(input: $input) {
            userLandDuty {
              id
              }
            }
          }
      GRAPHQL
    end

    it "creates a new user_land_duty" do
      input = {
        userId: global_id(create(:user), Outputs::UserType),
        landDutyId: global_id(create(:land_duty), Outputs::LandDutyType)
      }

      result = execute query, as: build(:user), variables: {input: input}

      create_user_land_duty = result[:data][:createUserLandDuty]
      expect(UserLandDuty.count).to eq(1)
    end
  end
end
