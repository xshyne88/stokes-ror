require "rails_helper"

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
      completed_duties =
        [1, 2, 3, 4, 5].reverse.map { |x| create(:completed_duty, created_at: DateTime.now + x) }

      result = CompletedDuty.most_recent

      expect(result.count).to eq(5)
      expect(result.first).to eq(completed_duties.first)
      expect(result.last).to eq(completed_duties.last)
    end
  end
  describe "most recent user to complete" do
    it "retrieves the usre who most recentl ocmpleted this duty" do
      user = create(:user)
      user2 = create(:user)
      Audited.audit_class.as_user(user) { create(:completed_duty) }
      Audited.audit_class.as_user(user2) {
        completed_duty = create(:completed_duty)

        result = completed_duty.most_recent_user_to_complete

        expect(result.name).to eq(user2.name)
      }
    end
  end
end
