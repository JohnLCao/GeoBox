require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "admin can access list of users and files" do
    admin = users(:admin)
    get "/login"
    assert_response :success
    post "/sessions", username: admin.username, password: default_password
    assert_redirect_to admin_root_path # pass if admin is redirect_to admin_root_path
  end

  test "regular user should not access list of users and files" do
    regular = users(:regular)
    get "/login"
    assert_response :success
    post "/sessions", username: regular.username, password: default_password
    get admin_root_path
    assert_response :redirect_to  # pass if the relugar is redirect_to login page
  end

end
