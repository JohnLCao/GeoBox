require 'rails_helper'

RSpec.feature "DownloadFile", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:user) { FactoryBot.create(:user) }
  scenario "user login - upload files - view files - download - logout" do
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    find_by_id('dropdownMenuButton').click
    click_on "Document"
    fill_in "Description", with: "Just for fun"
    attach_file "Attachment", "#{Rails.root}/spec/files/test2.txt"
    click_button "Submit"
    find_link(href: '#home').click
    click_on("test2.txt")
    expect(page).to have_content "This is to test the download file function."
    page.driver.go_back
    click_on "Logout"
  end

  scenario "user login - create and add file to the book - view books - download - logout" do
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    find_by_id('dropdownMenuButton').click
    click_on "Book"
    expect(page).to have_current_path new_book_path
    fill_in "Name", with: "Book 1"
    fill_in "Description", with: "Create a book"
    fill_in "Key", with: "simple"
    click_button "Submit"
    find_link(href: '#books').click
    click_on "View Contents"
    fill_in "Key", with: "simple"
    click_on "Add Document"
    fill_in "Description", with: "Add file to book"
    attach_file "Attachment", "#{Rails.root}/spec/files/test2.txt"
    click_button "Submit"
    find_link(href: '#books').click
    click_on "View Contents"
    fill_in "Key", with: "simple"
    click_on("test2.txt")
    expect(page).to have_content "This is to test the download file function."
    page.driver.go_back
    click_on "Logout"
  end

end
