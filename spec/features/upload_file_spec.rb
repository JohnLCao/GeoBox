require 'rails_helper'

RSpec.feature "UploadFile", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:admin) { FactoryBot.create(:admin) }
  let(:user) { FactoryBot.create(:user) }
  # scenario "admin uploads a file" do
  #   visit login_path
  #   fill_in "Username", with: admin.username
  #   fill_in "Password", with: admin.password
  #   click_button "Login"
  #   click_on "Documents"
  #   click_on "New Document"
  #   fill_in "Description", with: "Just for fun"
  #   attach_file "Attachment", "#{Rails.root}/spec/files/test.txt"
  #   click_button "Submit"
  #   expect(page).to have_content 'Document was successfully created.'
  #   expect(page).to have_current_path root_path
  # end

  scenario "user uploads a file" do
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    click_on(class: 'fa fa-plus btn')
    fill_in "Description", with: "Just for fun"
    attach_file "Attachment", "#{Rails.root}/spec/files/test.txt"
    click_button "Submit"
    expect(page).to have_content 'Document was successfully created.'
    expect(page).to have_current_path root_path
  end
end
