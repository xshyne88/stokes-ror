require "rails_helper"

describe "Land Query", :graphql do
  describe "land" do
    let(:query) do
      <<-'GRAPHQL'
        query($landId: ID!) {
          land(landId: $landId) {
            id
          }
        }
      GRAPHQL
    end

    it "return the specified land" do
      land = create(:land)
      land_id = global_id(land, Outputs::LandType)

      result = execute query, as: build(:user), variables: { landId: land_id }

      expect(result[:data][:land]).to include(id: land_id)
    end
  end
end
