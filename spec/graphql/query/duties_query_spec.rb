require "rails_helper"

describe "Duties Query", :graphql do
  describe "query duties for name" do
    query =
      <<-'GRAPHQL'
        query {
          duties {
            edges {
              node {
                name
              }
            }
          }
        }
      GRAPHQL
    it "returns a list of duties" do
      duty = create(:duty, name: "Duty 1")

      result = execute query, as: build(:user)
      pp result

      duties_result = result[:data][:duties][:edges].pluck(:node)
      expect(duties_result).to include(name: duty.name)
    end
  end
end
