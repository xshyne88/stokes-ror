require "rails_helper"

describe "Create LandDuty Mutation", :graphql do
  describe "createLandDuty" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: CreateLandDutyInput!) {
          createLandDuty(input: $input) {
            landDuty {
                estimatedDays
               }
            }
          }
      GRAPHQL
    end

    it "creates a new land_duty" do
      input = {
        landId: global_id(create(:land), Outputs::LandType),
        dutyId: global_id(create(:duty), Outputs::DutyType),
        estimatedDays: 5,
      }

      result = execute query, as: build(:user), variables: {input: input}

      land_duty = result[:data][:createLandDuty]
      expect(LandDuty.count).to eq(1)
      expect(land_duty[:landDuty][:estimatedDays]).to eq(5)
    end
  end
end
