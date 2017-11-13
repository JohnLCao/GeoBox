require 'rails_helper'

RSpec.feature "UserFlows", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:user) { FactoryBot.create(:user) }
  let(:admin) { FactoryBot.create(:admin) }
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

  scenario "admin uploads a file" do
    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Login"
    click_on "Documents"
    click_on "New Document"
    fill_in "Description", with: "Just for fun"
    attach_file "Attachment", "#{Rails.root}/spec/files/test.txt"
    click_button "Submit"
    expect(page).to have_content 'Document was successfully created.'
    expect(page).to have_current_path root_path
  end

end
