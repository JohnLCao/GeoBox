require 'rails_helper'

RSpec.feature "UserLogin", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:user) { FactoryBot.create(:user) }
  # self.use_transactional_fixtures = false
  scenario "user login - logout" do
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
end
