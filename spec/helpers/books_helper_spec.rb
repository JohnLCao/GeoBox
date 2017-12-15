require "rails_helper"

RSpec.describe BooksHelper, :type => :helper do
  describe "#mutualRadius?" do
    it "returns true when user is within doc. radius" do
      userCurrentLatlng = {lat: 100, lng: 100}
      expect(BooksHelper.mutualRadius?(userCurrentLatlng, 100, 100)).to be true
    end

    it "returns false when user is out of doc. radius" do
      userCurrentLatlng = {lat: 1000, lng: 1000}
      expect(BooksHelper.mutualRadius?(userCurrentLatlng, 100, 100)).to be false
    end

    it "returns only books within the radius" do
      book1 = FactoryBot.create(:book)
      book2 = FactoryBot.create(:book)
      userCurrentLatlng = {lat: 100, lng: 100}
      expect(BooksHelper.fetchbooks(userCurrentLatlng)).not_to be_empty
      puts "======================================="
      puts book1.filename
      puts book2.filename
      puts BooksHelper.fetchbooks(userCurrentLatlng).first[:filename]
      puts BooksHelper.fetchbooks(userCurrentLatlng).second[:filename]
      puts "======================================="
      expect(BooksHelper.fetchbooks(userCurrentLatlng).first[:filename]).to eq("book1")
      expect(BooksHelper.fetchbooks(userCurrentLatlng).second[:filename]).to eq("book2")
    end

    it "returns empty array when user is out of book's radius" do
      book = FactoryBot.create(:book, latitude: 1000, longitude: 1000)
      userCurrentLatlng = {lat: 100, lng: 100}
      expect(BooksHelper.fetchbooks(userCurrentLatlng)).to eq([])
    end

  end
end
