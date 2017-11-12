require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with a username, email" do
    expect(build(:user)).to be_valid
  end
  it "is invalid without a username" do
    user = build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end
  it "is invalid without an email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end
  it "is invalid with a duplicate username" do
    user1 = create(:user)
    user2 = build(:user, username: user1.username)
    user2.valid?
    expect(user2.errors[:username]).to include ("has already been taken")
  end
  it "is invalid with a duplicate email" do
    user1 = create(:user)
    user2 = build(:user, email: user1.email)
    user2.valid?
    expect(user2.errors[:email]).to include ("has already been taken")
  end
  it "is invalid with a wrong email format" do
    user = build(:user, email: 'invalid email')
    user.valid?
    expect(user.errors[:email]).to include("is invalid")
  end
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end
end
