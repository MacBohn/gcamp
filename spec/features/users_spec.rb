require 'rails_helper'

feature "Users" do
  before do
    User.delete_all
    @user = User.create!(
    email: "joe@email.com",
    password: "1234",
    first_name: "Joe",
    last_name: "Guy"
    )

    visit 'sign-in'
    fill_in "Email", with: "joe@email.com"
    fill_in "Password", with: "1234"
    click_on "Sign in"
  end

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
  end
  scenario "User can update user" do
    visit users_path
    click_on "Edit"
    fill_in "First name", with: "MATT"
    fill_in "Last name", with: "MATH"
    fill_in "Email", with: "email@email.com"
    fill_in "Password", with: "pass"
    fill_in "Password confirmation", with: "pass"
    click_on "Update User"
    expect(page).to have_content("MATT")
  end
  scenario "User can delete user" do
    visit users_path
    expect(page).to have_content("Joe Guy")
    click_on "Edit"
    click_on "Delete User"
    expect(page).to have_content("User was successfully destroyed")
    expect(page).to have_no_content("Joe Guy")
  end
end
