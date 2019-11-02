require "rails_helper"

describe "Lands Query", :graphql do
  describe "query lands for name" do
    query =
      <<-'GRAPHQL'
        query {
          lands {
            edges {
              node {
                name
              }
            }
          }
        }
      GRAPHQL
    it "returns a list of lands" do
      land = create(:land, name: "Land 1")

      result = execute query
      pp result

      lands_result = result[:data][:lands][:edges].pluck(:node)
      expect(lands_result).to include(name: land.name)
    end
  end
end
