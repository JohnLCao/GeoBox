require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  test "admin can access list of users and files" do
    admin = users(:admin)
    get "/login"
    assert_response :success
    post "/sessions", params: { user: { username: admin.username, password: default_password } }
    assert_redirected_to admin_root_path # pass if admin is redirect_to admin_root_path
  end

  test "regular user should not access list of users and files" do
    regular = users(:regular)
    get "/login"
    assert_response :success
    post "/sessions", params: { user: { username: regular.username, password: default_password } }
    assert_redirected_to root_path # pass if admin is redirect_to root_path
    get admin_root_path
    assert_response :redirect  # pass if the relugar is redirect_to login page
  end

end
