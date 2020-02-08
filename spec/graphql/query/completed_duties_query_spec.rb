require "rails_helper"

describe "CompletedDuties Query", :graphql do
  describe "query completedDuties for name" do
    query =
      <<-'GRAPHQL'
        query {
          completedDuties {
            edges {
              node {
                landDuty {
                  duty {
                    name
                  }
                }
              }
            }
          }
        }
      GRAPHQL
    it "returns a list of completedDuties" do
      completed_duty = create(:completed_duty)

      result = execute query, as: build(:user)

      nodes = result[:data][:completedDuties][:edges].pluck(:node)
      expect(nodes.first[:landDuty][:duty]).to include(name: completed_duty.land_duty.duty.name)
    end
  end

  describe "CompletedDuties Query", :graphql do
    describe "query completedDuties verifiedCompletedDuties" do
      query =
      <<-'GRAPHQL'
        query {
          completedDuties {
            edges {
              node {
                verifiedCompletedDuties {
                  edges {
                    node {
                      id
                      }
                    }
                  }
                }
              }
            }
          }
      GRAPHQL
      it "returns a list of completedDuties and their verified completed duties" do
          completed_duty = create(:completed_duty)
          verified_completed_duty = create(:verified_completed_duty, completed_duty:completed_duty, extension: 1)

          result = execute query, as: build(:user)

          node = result[:data][:completedDuties][:edges].first[:node]
          vcd_id = node[:verifiedCompletedDuties][:edges].first[:node][:id]

          expect(vcd_id).to eq(global_id(verified_completed_duty, Outputs::VerifiedCompletedDutyType))
      end
    end
  end
end
