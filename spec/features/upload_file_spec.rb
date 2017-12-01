require 'rails_helper'

RSpec.feature "UploadFile", type: :feature, js: true do
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:admin) { FactoryBot.create(:admin) }
  let(:user) { FactoryBot.create(:user) }
  scenario "admin uploads a file without a book" do
    visit login_path
    fill_in "Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Login"
    click_on "Dashboard"
    click_on "Documents"
    click_on "New Document"
    fill_in "Description", with: "Just for fun"
    attach_file "Attachment", "#{Rails.root}/spec/files/test.txt"
    click_button "Submit"
    expect(page).to have_content 'Document was successfully created.'
    expect(page).to have_current_path root_path
  end

  scenario "user uploads a file without a book" do
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    find_by_id('dropdownMenuButton').click
    click_on "Document"
    fill_in "Description", with: "Just for fun"
    attach_file "Attachment", "#{Rails.root}/spec/files/test2.txt"
    click_button "Submit"
    expect(page).to have_text 'Document was successfully created.'
    expect(page).to have_current_path root_path
  end

  scenario "user create a book and upload a file" do
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    find_by_id('dropdownMenuButton').click
    click_on "Book"
    expect(page).to have_current_path new_book_path
    fill_in "Name", with: "Test book 1"
    fill_in "Description", with: "Test creating a book"
    fill_in "Key", with: "simple"
    click_button "Submit"
    expect(page).to have_text 'Book was successfully created.'
    expect(page).to have_current_path root_path
    find_link(href: '#books').click
    click_on "View Contents"
    fill_in "Key", with: "simple"
    click_on "Add Document"
    fill_in "Description", with: "Test add file to book"
    attach_file "Attachment", "#{Rails.root}/spec/files/test2.txt"
    click_button "Submit"
    expect(page).to have_text 'Document was successfully created.'
    expect(page).to have_current_path root_path
    find_link(href: '#books').click
    click_on "View Contents"
    fill_in "Key", with: "simple"
    expect(page).to have_content "Test book 1"
  end
end
