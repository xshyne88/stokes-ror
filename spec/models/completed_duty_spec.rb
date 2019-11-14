require 'rails_helper'

describe CompletedDuty, type: :model do
  context "validations" do
    it "validly creates a user land duty" do

      completed_duty = create(:completed_duty, completed_at: DateTime.now)

      expect(completed_duty).to be_valid
    end
  end
    describe ".complete?" do
      it "queries the completedAt field via complete" do
        completed_duty = create(:completed_duty)

        expect(completed_duty.completed?).to be(false)
      end
    end

    describe ".mark_complete" do
      it "marks itself complete" do
        completed_duty = create(:completed_duty, completed_at: nil)

        completed_duty.mark_complete

        expect(completed_duty.reload.completed?).to be(true)
    end
  end
end

