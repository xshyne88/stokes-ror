require "rails_helper"

describe "Create LandNote Mutation", :graphql do
  describe "createLandNote" do
    let(:query) do
      <<~'GRAPHQL'
        mutation($input: CreateLandNoteInput!) {
          createLandNote(input: $input) {
            land {
              notes {
edges { node { body }}
              }
            }
            }
          }
      GRAPHQL
    end

    it "creates a new land_note" do
      land = create(:land)
      input = {
        landId: global_id(land, Outputs::LandType),
        body: "sup man"
      }

      result = execute query, as: build(:user), variables: {input: input}

      land_note = result[:data][:createLandNote]
      expect(land.notes.count).to eq(1)
      expect(land_note[:land][:notes][:edges].first[:node][:body]).to eq("sup man")
    end
  end
end
