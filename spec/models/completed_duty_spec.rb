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
      middle = create(:completed_duty, created_at: 3.days.ago)
      oldest = create(:completed_duty, created_at: 5.days.ago)
      recent = create(:completed_duty, created_at: 1.days.ago)

      result = CompletedDuty.most_recent

      expect(result).to eq([recent, middle, oldest])
    end
  end

  describe "active scope" do
    it "describes only the most active completed_duty" do
      create(:completed_duty, expired: true)
      target = create(:completed_duty, expired: false)
      create(:completed_duty, expired: true)

      result = CompletedDuty.active

      expect(result.first).to eq(target)
      expect(result.count).to eq(1)
    end
  end


  def now
    DateTime.now
  end
end
