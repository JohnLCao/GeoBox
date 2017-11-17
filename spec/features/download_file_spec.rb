require 'rails_helper'

RSpec.feature "DownloadFile", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:user) { FactoryBot.create(:user) }
  # self.use_transactional_fixtures = false
  scenario "user login - view files - download - logout" do
    # user = FactoryBot.create(:user)
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    # find('fa fa-bars', visible: false).click



    click_on "Logout"
  end

end
