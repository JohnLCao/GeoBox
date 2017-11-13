require 'rails_helper'

RSpec.describe Document, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with a filename, coordinate, and attachment" do
    expect(build(:document)).to be_valid
  end

  it "is invalid without a filename" do
    document = build(:document, filename: nil)
    document.valid?
    expect(document.errors[:filename]).to include("can't be blank")
  end

  it "is invalid without a attachment" do
    document = build(:document, attachment: nil)
    document.valid?
    expect(document.errors[:attachment]).to include("can't be blank")
  end

  it "is invalid with a duplicate file name" do
    document1 = create(:document)
    document2 = build(:document, filename: document1.filename)
    document2.valid?
    expect(document2.errors[:filename]).to include ("has already been taken")
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "generates assocated data from a user" do
    document = create(:document)
    expect(document.user.username).to include("user")
    puts "This document's user is #{document.user.inspect}"
  end

end
