require 'rails_helper'

describe Land, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
      expect(build(:land)).to be_valid
    end

    it { should validate_presence_of(:name) }

    it "is not valid with a non-unique name" do
      land = create(:land)
      duplicate_land = build(:land, name: land.name)

      expect(duplicate_land).not_to be_valid
    end
  end
end
