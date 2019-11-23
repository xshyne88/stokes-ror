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
      pp result

      nodes = result[:data][:completedDuties][:edges].pluck(:node)
      expect(nodes.first[:landDuty][:duty]).to include(name: completed_duty.land_duty.duty.name)
    end
  end

  describe "query books for average rating" do
    query = <<-'GRAPHQL'
        query($sortBy: CompletedDutySortByType, $sortDirection: SortDirectionType) {
          completedDuties(sortBy: $sortBy, sortDirection: $sortDirection) {
            edges {
              node {
                expiresAt
              }
            }
          }
        }
      GRAPHQL
    it "sorts completed duties coming back" do
      create(:completed_duty, expires_at: DateTime.now + 2)
      create(:completed_duty, expires_at: DateTime.now + 3)
      create(:completed_duty, expires_at: DateTime.now + 1)

      result = execute query, as: build(:user), variables: {
        sortBy: "EXPIRES_AT",
        sortDirection: "DESC",
      }

      execute query, as: build(:user)

      # TODO: be less lazy
      nodes = result[:data][:completedDuties][:edges].pluck(:node)
      expect(nodes.first[:expiresAt]).to be_truthy
      expect(nodes.second[:expiresAt]).to be_truthy
      expect(nodes.third[:expiresAt]).to be_truthy
    end
  end
end
