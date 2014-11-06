require 'rails_helper'

feature "Users" do

  scenario "User create users" do
     visit users_path
     click_on "Create Users"
     fill_in "First name", with: "GREG"
     fill_in "Last name", with: "OMARS"
     fill_in "Email", with: "email@email.com"
     fill_in "Password", with: "pass"
     fill_in "Password confirmation", with: "pass"
     click_on "Create User"
     expect(page).to have_content("GREG")
     #EDIT/UPDATE
     click_on "Edit"
     fill_in "First name", with: "MATT"
     fill_in "Last name", with: "MATH"
     fill_in "Email", with: "email@email.com"
     fill_in "Password", with: "pass"
     fill_in "Password confirmation", with: "pass"
     click_on "Update User"
     expect(page).to have_content("MATT")
     #DELETE
     click_on "Edit"
     click_on "Delete User"
     expect(page).to have_content("User was successfully destroyed")
     expect(page).to have_no_content("MATT")
     save_and_open_page
   end
 end
