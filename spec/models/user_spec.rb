require 'rails_helper'

RSpec.describe User, type: :model do
  describe ".guest" do
    it "returns false" do
      expect(create(:user).guest?).to be(false)
    end
  end
end
