require "rails_helper"

describe "Create Duty Mutation", :graphql do
  describe "createDuty" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: CreateDutyInput!) {
          createDuty(input: $input) {
            duty {
              name
              description
              }
            }
          }
      GRAPHQL
    end

    it "creates a new duty" do
      name = "Duty 1"
      description = "A new Duty"

      result = execute query, as: build(:user), variables: {
        input: {
          name: name,
          description: description,
        },
      }

      create_duty = result[:data][:createDuty]
      result_name = create_duty[:duty][:name]
      expect(Duty.count).to eq(1)
      expect(result_name).to eq(name)
    end
  end
end
