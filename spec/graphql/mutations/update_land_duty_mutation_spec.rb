require "rails_helper"

describe "Update LandDuty Mutation", :graphql do
  describe "updateLandDuty" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: UpdateLandDutyInput!) {
          updateLandDuty(input: $input) {
            landDuty {
                estimatedDays
               }
            }
          }
      GRAPHQL
    end

    it "updates a land_duty" do
      land_duty = create(:land_duty)
      land_duty_id = global_id(land_duty, Outputs::LandDutyType)

      land_duty_input = {
        estimatedDays: 140,
      }

      result = execute query, as: build(:user), variables: {input:
        {landDutyId: land_duty_id, landDutyInput: land_duty_input}}

      land_duty = result[:data][:updateLandDuty]
      expect(land_duty[:landDuty][:estimatedDays]).to eq(140)
    end
  end
end
