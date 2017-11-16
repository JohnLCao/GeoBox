require 'rails_helper'

RSpec.feature "AdminLogin", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:admin) { FactoryBot.create(:admin) }
  scenario "admin login - logout" do
    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Login"
    expect(page).to have_current_path admin_root_path
    click_on "Users"
    expect(page).to have_current_path users_path
    click_on "Back"
    expect(page).to have_current_path admin_root_path
    click_on "Documents"
    expect(page).to have_current_path documents_path
    click_on "Logout"
    expect(page).to have_content 'You have been logged out'
    expect(page).to have_current_path login_path
  end
end
