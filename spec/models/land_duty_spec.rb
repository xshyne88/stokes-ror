require 'rails_helper'

describe LandDuty, type: :model do
  context "validations" do
    it "validly creates a land duty" do

      land_duty = create(:land_duty, estimated_days: 14)

      expect(land_duty).to be_valid
    end
  end
end

