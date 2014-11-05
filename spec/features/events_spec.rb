require 'rails_helper'

feature "Projects" do

  scenario "User create project" do
    Project.create!(
      name: "Project"
    )

    visit root_path
    expect(page).to have_content("Projects")
    click_on "Create Project"
    fill_in "Name", with: "ProjectsName"
    click_on "Create Project"
    save_and_open_page
    expect(page).to have_content("Projects")
  end
end
