require "rails_helper"

describe "Delete UserLandDuty Mutation", :graphql do
  describe "deleteUserLandDuty" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: DeleteUserLandDutyInput!) {
          deleteUserLandDuty(input: $input) {
              success
            }
          }
      GRAPHQL
    end

    it "deletes a new user_land_duty" do
      user_land_duty = create(:user_land_duty)
      input = {
        userLandDutyId: global_id(user_land_duty, Outputs::UserLandDutyType)
      }

     result = execute query, as: build(:user), variables: {input: input}

     success = result[:data][:deleteUserLandDuty][:success]
     expect(UserLandDuty.count).to eq(0)
     expect(success).to be(true)
    end
  end
end
