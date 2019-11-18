require "rails_helper"

RSpec.describe CompletedDuty, type: :model do
  describe ".mark_expired" do
    it "marks itself expired" do
      completed_duty = create(:completed_duty)

      completed_duty.mark_expired

      expect(completed_duty.reload.expired?).to be(true)
    end
  end
end
