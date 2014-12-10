require 'rails_helper'

feature "Membership" do
  scenario "User adds member to a project" do

    project = Project.create!(name: "YOOOOO")
    User.delete_all
    user = User.create!(first_name: "Mark",
    last_name: "Jones",
    email: "y@y.com",
    password: "password"
    )
    different_user = User.create!(
    email: "joe@e.com",
    password: "1234",
    first_name: "Joe",
    last_name: "Guy"
    )

    visit signin_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_on "Sign in"
    visit project_path(project)
    click_on "Memberships"
    select different_user.full_name, from: 'membership_user_id'
    select "owner", from: 'membership_role'
    click_on "Create Membership"
    within '.table' do
      expect(page).to have_content different_user.full_name
    end

  end
end
