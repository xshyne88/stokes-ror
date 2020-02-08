require "rails_helper"

describe CompletedDuty, type: :model do
  context "validations" do
    it "validly creates a user land duty" do
      verified_completed_duty = create(:verified_completed_duty, extension: 1)

      expect(verified_completed_duty).to be_valid
    end
  end

  context "normal" do
    it "updates its completed duties expiration date" do
      completed_duty = create(:completed_duty)
      completed_duty_expiration = completed_duty.expires_at.day
      pp completed_duty

      verified_completed_duty = create(:verified_completed_duty, extension: 5, completed_duty: completed_duty)

      pp verified_completed_duty.completed_duty.reload
      expect(verified_completed_duty.completed_duty.expires_at.day).to eq(completed_duty_expiration + 5)
    end 
  end
end 