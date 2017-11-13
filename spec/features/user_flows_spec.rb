require 'rails_helper'

RSpec.feature "UserFlows", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:user) { FactoryBot.create(:user) }
  # self.use_transactional_fixtures = false
  scenario "regular user log in to the home page then log out" do
    # user = FactoryBot.create(:user)
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    expect(page).to have_content 'Logged in succesfully'
    expect(page).to have_current_path root_path
    click_on "Logout"
    expect(page).to have_content 'You have been logged out'
    expect(page).to have_current_path login_path

  end

  # scenario "admin logs in to the admin page" do
  #   user = FactoryBot.create(:admin)
  #   visit login_path
  #   fill_in "Username", with: user.username
  #   fill_in "Password", with: user.password
  #   click_button "Login"
  #   # expect(page).to have_content 'Logged in succesfully'
  #   expect(page).to have_current_path admin_root_path
  #   # access #index manually
  #   visit users_path
  #   expect(page).to have_current_path users_path
  #   puts page.body
  #   # click_on "Logout"
  # end

end
