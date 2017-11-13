require "rails_helper"

RSpec.describe DocumentsHelper, :type => :helper do
  describe "#mutualRadius?" do
    it "returns true when user is within doc. radius" do
      userCurrentLatlng = Hash.new
      userCurrentLatlng[:lat] = 100
      userCurrentLatlng[:lng] = 100
      expect(DocumentsHelper.mutualRadius?(userCurrentLatlng, 100, 100)).to be true
    end

    it "returns false when user is out of doc. radius" do
      userCurrentLatlng = Hash.new
      userCurrentLatlng[:lat] = 10000
      userCurrentLatlng[:lng] = 10000
      expect(DocumentsHelper.mutualRadius?(userCurrentLatlng, 100, 100)).to be false
    end
  end
end
