require 'rails_helper'

  feature "Sign In" do

scenario "User can Sign Up" do
  visit sign_up_path
  click_on "Sign Up"
  fill_in "First name", with: "MAC"
  fill_in "Last name" , with: "DRE"
  fill_in "Email", with: "mac@dre.com"
  fill_in "Password", with: "pass"
  fill_in "Password confirmation", with: "pass"
  click_on "Sign up"
  expect(page).to have_content("Your life, organized.")



      click_on "Sign Out"
      expect(page).to have_content("© Mega Mac Company")




      visit sign_in_path
      click_on "Sign In"
      fill_in "Email", with: "mac@dre.com"
      fill_in "Password", with: "pass"
      click_on "Sign in"
      expect(page).to have_content("© Mega Mac Company")
     end
   end
