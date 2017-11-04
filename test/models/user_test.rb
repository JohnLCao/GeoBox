require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

  def setup
    @user = User.create(username: "user", email: "user@sfu.ca", password: "secrete", user_class: "regular")
  end

  test "should not have blank user name" do
    new_user = User.new(email: "valid_email@sfu.ca", password: "secrete", user_class: "regular")
    assert_not new_user.save, "Save the user without an username"
  end

  test "should not have the same username" do
    @duplicate_user = @user.dup
    @duplicate_user.email = "valid_email@sfu.ca"
    assert_not @duplicate_user.valid?, "Create the user with existing username"
  end

  test "should not have blank email" do
    user = User.new(username: "valid_username", password: "secrete", user_class: "regular")
    assert_not user.save, "Save the user without an email"
  end

  test "should not have the same email" do
    @duplicate_user = @user.dup
    @duplicate_user.username = "valid_username"
    assert_not @duplicate_user.valid?, "Create the user with existing email"
  end

  test "should not have invalid email format" do
    @new_user = User.new(username: "valid_username", email: "wrongemailformat", password: "secrete", user_class: "regular")
    assert_no_match(EMAIL_REGEX, @new_user.email, "Invalid email format") # just for double check the defined EMAIL_REGEX works
    assert_not @new_user.save, "Save the user without valid email"
  end

  test "should not create user with different password and password confirmation" do
    @new_user = User.new(
      username: "valid_username",
      email: "valid@email.ca",
      password:"pass",
      password_confirmation:"word",
      user_class:"regular")
    assert_not @new_user.save, "Save the user with different password and password confirmation fields"
  end

end
