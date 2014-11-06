require 'rails_helper'

  feature "Sign In" do
    scenario "Sign In" do
      User.create!(email:"yo@yo.com", password:"yo")
      visit sign_in_path
      click_on "Sign In"
      fill_in "Email", with: "yo@yo.com"
      fill_in "Password", with: "yo"
      click_on "Sign in"
      expect(page).to have_content("© Mega Mac Company")
      save_and_open_page
     end
   end
