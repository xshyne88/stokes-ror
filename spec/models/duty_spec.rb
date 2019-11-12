require 'rails_helper'

RSpec.describe UserLandDuty, type: :model do
  describe ".complete?" do
    it "queries the completedAt field via complete" do
      user_land_duty = create(:user_land_duty)

      expect(user_land_duty.completed?).to be(false)
    end
  end

  describe ".mark_complete" do
    it "marks itself complete" do
      user_land_duty = create(:user_land_duty)

      user_land_duty.mark_complete

      expect(user_land_duty.reload.completed?).to be(true)
    end
  end
end
