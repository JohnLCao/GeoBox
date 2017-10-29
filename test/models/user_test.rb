require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  def setup
    @user = User.create(username: "User1", email: "user1sfu.ca", password: "secrete")
  end

  test "should not have the same username" do
    duplicate_user = @user.dup
    assert_not duplicate_user.valid?, "Create the user with existing username"
  end

  test "should not have the same email" do
    duplicate_user = @user.dup
    assert_not duplicate_user.valid?, "Create the user with existing email"
  end

  test "should not have blank user name" do
    user = User.new(password: "secrete")
    assert_not user.save, "Save the user without an username"
  end

  test "should not have blank email" do
    user = User.new(password: "secrete")
    assert_not user.save, "Save the user without an emal"
  end

  test "should not have invalid email format" do
    assert_match(EMAIL_REGEX, @user.email, "Invalid email format")
  end

end
