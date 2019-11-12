require "rails_helper"

describe "Delete LandDuty Mutation", :graphql do
  describe "deleteLandDuty" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: DeleteLandDutyInput!) {
          deleteLandDuty(input: $input) {
              success
            }
          }
      GRAPHQL
    end

    it "deletes a new land_duty" do
      land_duty = create(:land_duty)
      input = {
        landDutyId: global_id(land_duty, Outputs::LandDutyType)
      }

      result = execute query, as: build(:user), variables: {input: input}
      pp result

      success = result[:data][:deleteLandDuty][:success]
      expect(LandDuty.count).to eq(0)
      expect(success).to be(true)
    end
  end
end
