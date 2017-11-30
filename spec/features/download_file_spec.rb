require 'rails_helper'

RSpec.feature "DownloadFile", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:user) { FactoryBot.create(:user) }
  # self.use_transactional_fixtures = false
  scenario "user login - upload files - view files - download - logout" do
    # user = FactoryBot.create(:user)
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    click_on(class: 'fa fa-plus btn')
    fill_in "Description", with: "Just for fun"
    attach_file "Attachment", "#{Rails.root}/spec/files/test.txt"
    click_button "Submit"
    find_link(href: '#home').click
    expect(page).to have_content "test.txt"
    click_on("test.txt")
    expect(page).to have_content "This is to test the upload file function."
    page.driver.go_back
    click_on "Logout"
  end

end
