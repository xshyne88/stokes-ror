require "rails_helper"

describe "Update Duty Mutation", :graphql do
  describe "updateDuty" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: UpdateDutyInput!) {
          updateDuty(input: $input) {
            duty {
              estimatedDays
              }
            }
          }
      GRAPHQL
    end

    it "updates a duty" do
      duty = create(:duty)
      duty_id = global_id(duty, Outputs::DutyType)

      duty_input = {
        estimatedDays: 140,
      }

      result = execute query, as: build(:user), variables: {input:
        {dutyId: duty_id, dutyInput: duty_input}}


      duty = result[:data][:updateDuty]
      expect(duty[:duty][:estimatedDays]).to eq(140)
    end
  end
end
