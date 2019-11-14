require "rails_helper"

describe "Delete CompletedDuty Mutation", :graphql do
  describe "deleteCompletedDuty" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: DeleteCompletedDutyInput!) {
          deleteCompletedDuty(input: $input) {
              success
            }
          }
      GRAPHQL
    end

    it "deletes a new completed_duty" do
      completed_duty = create(:completed_duty)
      input = {
        CompletedDutyId: global_id(completed_duty, Outputs::CompletedDutyType)
      }

     result = execute query, as: build(:user), variables: {input: input}

     success = result[:data][:deleteCompletedDuty][:success]
     expect(CompletedDuty.count).to eq(0)
     expect(success).to be(true)
    end
  end
end
