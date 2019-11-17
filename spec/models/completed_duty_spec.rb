require 'rails_helper'

describe CompletedDuty, type: :model do
  context "validations" do
    it "validly creates a user land duty" do

      completed_duty = create(:completed_duty, expires_at: DateTime.now)

      expect(completed_duty).to be_valid
    end
  end
    describe ".expired?" do
      it "queries the expiredAt field via complete" do
        completed_duty = create(:completed_duty)

        expect(completed_duty.expired?).to be(false)
      end
    end

    describe ".mark_expired" do
      it "marks itself expired" do
        completed_duty = create(:completed_duty, expired: false)

        completed_duty.mark_expired

        expect(completed_duty.expired?).to be(true)
    end
  end

    describe "most_recent scope" do
      it "gets the 5 most recent completed duties in order by latest -> oldest" do
        5.times { create(:completed_duty) }

        result = CompletedDuty.most_recent


        expect(CompletedDuty.all.count).to eq(5)
      end
    end
end

