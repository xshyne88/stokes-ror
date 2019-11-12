require 'rails_helper'

describe UserLandDuty, type: :model do
  context "validations" do
    it "validly creates a user land duty" do

      user_land_duty = create(:user_land_duty, completed_at: DateTime.now)

      expect(user_land_duty).to be_valid
    end
  end
    describe ".complete?" do
      it "queries the completedAt field via complete" do
        user_land_duty = create(:user_land_duty)

        expect(user_land_duty.completed?).to be(false)
      end
    end

    describe ".mark_complete" do
      it "marks itself complete" do
        user_land_duty = create(:user_land_duty, completed_at: nil)

        user_land_duty.mark_complete

        expect(user_land_duty.reload.completed?).to be(true)
    end
  end
end

