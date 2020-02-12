require "rails_helper"

describe "Create VerifiedCompletedDuty Mutation", :graphql do
  describe "createVerifiedCompletedDuty" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: CreateVerifiedCompletedDutyInput!) {
          createVerifiedCompletedDuty(input: $input) {
            verifiedCompletedDuty {
              id
              }
            }
          }
      GRAPHQL
    end

    it "creates a new verified completed_duty" do
      completed_duty = create(:completed_duty)
      input = {
        extension: 5,
        completedDutyId: global_id(completed_duty, Outputs::CompletedDutyType),
      }

      result = execute query, as: build(:user), variables: {input: input}

      expect(VerifiedCompletedDuty.count).to eq(1)
    end
  end 
end 