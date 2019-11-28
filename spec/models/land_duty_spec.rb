require "rails_helper"

describe LandDuty, type: :model do
  context "validations" do
    it "validly creates a land duty" do
      land_duty = create(:land_duty, estimated_days: 14)

      expect(land_duty).to be_valid
    end
  end
  context ".has_any_completions?" do
    it "shows whether or not the land duty has ever been worked on" do
      ld = create(:land_duty)
      create(:completed_duty, land_duty: ld)

      expect(ld.has_any_completions?).to be(true)
    end
    it "returns false when there are no records" do
      ld = create(:land_duty)

      expect(ld.has_any_completions?).to be(false)
    end
  end
end
