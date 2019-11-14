require "rails_helper"

describe "Create User Mutation", :graphql do
  describe "assignLandDuties" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: AssignLandDutiesInput!) {
          assignLandDuties(input: $input) {
            land {
              id
            landDuties {
              edges {
                node {
                  id
                     }
                   }
                }
              }
            }
          }
      GRAPHQL
    end

    it "bulk edits land duties onto land via an array of duty ids" do
      land = create(:land)
      duty = create(:duty)
      duty2 = create(:duty)
      duty3 = create(:duty)
      create(:land_duty, land: land, duty: duty)

      result = execute query, as: create(:user, :admin), variables: {
        input: {
          landId: global_id(land, Outputs::LandType),
          dutyIds: [duty2, duty3].map { |d| g_id(d) }
        }
      }

      mutated_land = result[:data][:assignLandDuties][:land]
      expect(mutated_land[:landDuties][:edges].count).to eq(2)
      expect(LandDuty.where(land: land, duty: duty).count).to be(0)
    end
  end

  def g_id(duty)
    global_id(duty, Outputs::DutyType)
  end
end
