require "rails_helper"

describe "Update CompletedDuty Mutation", :graphql do
  describe "updateCompletedDuty" do
    let(:query) do
      <<~'GRAPHQL'
                mutation($input: UpdateCompletedDutyInput!) {
                  updateCompletedDuty(input: $input) {
        errors { message }
                    completedDuty {
                      expiresAt
                      }
                    }
                  }
      GRAPHQL
    end

    it "updates a new completed_duty" do
      cd = create(:completed_duty, expires_at: DateTime.now)
      cd_id = global_id(cd, Outputs::CompletedDutyType)

      new_time = (DateTime.now + 5.days).strftime("%Y-%m-%dT%H:%M:%SZ")
      completed_duty_input = {
        expiresAt: new_time,
      }

      result = execute query, as: build(:user), variables: {input: {
        completedDutyId: cd_id, completedDutyInput: completed_duty_input,
      }}

      expired_time = result[:data][:updateCompletedDuty][:completedDuty][:expiresAt]
      expect(expired_time).to eq(new_time)
    end
  end
end
