require 'rails_helper'

RSpec.describe Book, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with book name, description and key" do
    expect(build(:book)).to be_valid
  end

  it "is invalid without a book name" do
    book = build(:book, name: nil)
    book.valid?
    expect(book.errors[:name]).to include ("can't be blank")
  end

  it "is invalid without a book description" do
    book = build(:book, description: nil)
    book.valid?
    expect(book.errors[:description]).to include ("can't be blank")
  end

  it "is invalid without a book key" do
    book = build(:book, key: nil)
    book.valid?
    expect(book.errors[:key]).to include ("can't be blank")
  end

  it "is invalid with a duplicate book name" do
    book1 = create(:book)
    book2 = build(:book, name: book1.name)
    book2.valid?
    expect(book2.errors[:name]).to include ("has already been taken")
  end
  
end
