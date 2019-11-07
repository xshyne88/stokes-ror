require 'rails_helper'

RSpec.describe Duty, type: :model do
  describe ".complete?" do
    it "queries the completedAt field via complete" do
      duty = create(:duty)
      pp duty

      expect(duty.completed?).to be(false)
    end
  end
  describe ".mark_complete" do
    it "marks itself complete" do
      duty = create(:duty)

      duty.mark_complete

      expect(duty.reload.completed?).to be(true)
    end
  end
end
