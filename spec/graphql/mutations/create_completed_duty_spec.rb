require "rails_helper"

describe "Create CompletedDuty Mutation", :graphql do
  describe "createCompletedDuty" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: CreateCompletedDutyInput!) {
          createCompletedDuty(input: $input) {
            completedDuty {
              id
              }
            }
          }
      GRAPHQL
    end

    it "creates a new completed_duty" do
      input = {
        userId: global_id(create(:user), Outputs::UserType),
        landDutyId: global_id(create(:land_duty), Outputs::LandDutyType)
      }

      result = execute query, as: build(:user), variables: {input: input}

      create_completed_duty = result[:data][:createCompletedDuty]
      expect(CompletedDuty.count).to eq(1)
    end

    it "properly updates land duty to be completed" do
      land = create(:land)
      user = create(:user)
      land_duty = create(:land_duty, land: land)
      input = {
        userId: global_id(user, Outputs::UserType),
        landDutyId: global_id(land_duty, Outputs::LandDutyType)
      }

      result = execute query, as: user, variables: {input: input}

      expect(land_duty.reload.status).to eq("completed")
    end
  end
end
