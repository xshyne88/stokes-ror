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
      let(:fields_query) do
        <<-'GRAPHQL'
        query($landId: ID!) {
          land(landId: $landId) {
            id
            name
            latitude
            longitude
          }
        }
      GRAPHQL
      end 

    it "returns the specified land" do
      land = create(:land)
      land_id = global_id(land, Outputs::LandType)

      result = execute query, as: build(:user), variables: { landId: land_id }

      expect(result[:data][:land]).to include(id: land_id)
    end

    it "can query name long and lat on the specified land" do
      name, lat, long = "name", "foo", "bar"
      land = create(:land, name: name, latitude: lat, longitude: long)
      land_id = global_id(land, Outputs::LandType)

      result = execute fields_query, as: build(:user), variables: { landId: land_id }


      expect(result[:data][:land]).to include(id: land_id, name: name, latitude: lat, longitude: long)
    end
  end

  describe "land duty meta data" do
    query = 
      <<-'GRAPHQL'
        query($landId: ID!) {
          land(landId: $landId) {
            id
            landDuties {
              edges {
                node {
                  id
                  status
                }
              }
            }
          }
        }
      GRAPHQL
      it "displays all the duties associated with it" do
        land = create(:land)
        land_duty1 = create(:land_duty, land: land)
        land_duty2 = create(:land_duty, land: land)
        user = create(:user)
  
        result = execute query, as: build(:user, admin: true), variables: { landId: global_id(land, Outputs::LandType) }
  
        land_duties = result[:data][:land][:landDuties][:edges]
        expect(land_duties.count).to eq(2)
      end

      it "properly updates land duty status when a duty is completed" do
        land = create(:land)
        duty = create(:duty)
        land_duty = create(:land_duty, land: land, duty: duty)
        create(:completed_duty, land_duty: land_duty)
  
        result = execute query, as: build(:user, admin: true), variables: { landId: global_id(land, Outputs::LandType) }
        pp result
  
        land_duties = result[:data][:land][:landDuties][:edges]
        expect(land_duties.count).to eq(1)
        expect(land_duties.first[:node][:status]).to eq("completed")
      end
  end

  describe "last completed query" do
    query = 
      <<-'GRAPHQL'
      query($landId: ID!) {
        land(landId: $landId) {
          id
          lastCompletedDuty
        }
      }
    GRAPHQL
    it "updates lastCompletedDuty when a duty is completed" do
      name = "pick up trash"
      land = create(:land)
      duty = create(:duty, name: name)
      land_duty = create(:land_duty, land: land, duty: duty)
      create(:completed_duty, land_duty: land_duty)

      result = execute query, as: build(:user, admin: true), variables: { landId: global_id(land, Outputs::LandType) }
    
      last_duty_name = result[:data][:land][:lastCompletedDuty]
      expect(last_duty_name).to eq(name)
    end 
  end
end
