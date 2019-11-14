require "rails_helper"

describe "Create CompletedDuty Mutation", :graphql do
  describe "createCompletedDuty" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: CreateCompletedDutyInput!) {
          createCompletedDuty(input: $input) {
            CompletedDuty {
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
  end
end
