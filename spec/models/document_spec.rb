require 'rails_helper'

RSpec.describe Document, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with a filename, coordinate, and attachment" do
    expect(build(:document)).to be_valid
  end

  it "generates assocated data from a user" do
    document = create(:document)
    expect(document.user.username).to include("user")
    puts "This document's user is #{document.user.inspect}"
  end

end
