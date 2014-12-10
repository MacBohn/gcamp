require 'rails_helper'

feature "Sign In" do
  before do
    User.delete_all
  end
  scenario "Sign In" do
    User.create!(first_name: "calo",
    last_name: "yoyoy",
    email:"yo@yaaa.com",
    password:"yo")
    visit sign_in_path
    click_on "Sign In"
    fill_in "Email", with: "yo@yo.com"
    fill_in "Password", with: "yo"
    click_on "Sign in"
    expect(page).to have_content("© Mega Mac Company")
  end
end
