require 'rails_helper'

RSpec.feature "AppFlow", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:user) { FactoryBot.create(:user) }
  # self.use_transactional_fixtures = false
  scenario "user login - view files - view books - view profile - logout" do
    # user = FactoryBot.create(:user)
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    expect(page).to have_current_path root_path
    find_link(href: "#home").click
    expect(page).to have_content "Files"
    find_link(href: "#books").click
    expect(page).to have_content "Books"
    find_link(href: "#profile").click
    expect(page).to have_content user.username
    expect(page).to have_content user.email
    click_on "Logout"
    expect(page).to have_content 'You have been logged out'
    expect(page).to have_current_path login_path
  end
end
