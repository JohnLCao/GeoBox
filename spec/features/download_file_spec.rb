require 'rails_helper'

RSpec.feature "DownloadFile", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:user) { FactoryBot.create(:user) }
  scenario "user login - upload files - view files - search for a file - download - logout" do
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
    find_by_id('search').click
    fill_in "Search for files...", with: "for sure you can't find it"
    expect(page).not_to have_content "test2.txt"
    fill_in "Search for files...", with: "tes"
    expect(page).to have_content "test2.txt"
    click_on("test2.txt")
    expect(page).to have_content "This is to test the download file function."
    page.driver.go_back
    click_on "Logout"
  end

  scenario "user login - create and add file to the book - view books - search for a book - download - logout" do
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
    fill_in "Search for books...", with: "for sure you can't find it"
    expect(page).not_to have_content "Book 1"
    fill_in "Search for books...", with: "ook 1"
    expect(page).to have_content "Book 1"
    click_on "View Contents"
    fill_in "Key", with: "simple"
    click_on("test2.txt")
    expect(page).to have_content "This is to test the download file function."
    page.driver.go_back
    click_on "Logout"
  end

end
