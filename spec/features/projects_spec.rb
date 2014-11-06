require 'rails_helper'

feature "Projects" do

  scenario "User create project" do
    visit projects_path
    expect(page).to have_content("Projects")
    Project.create!(name: "Project")
    click_on "Create Project"
    fill_in "Name", with: "ProjectsName"
    expect(page).to have_content("Projects")
    click_on "Create Project"
  end

  scenario "User delete a Project" do
    project = Project.create!(name: "Awesome Project")
    visit project_path(project)
    expect(page).to have_content(project.name)
    click_on "Delete"
    expect(page).to have_no_content(project.name)
  end

  scenario "User edits a Project" do
    project = Project.create!(name: "Awesome Project")
    visit project_path(project)
    expect(page).to have_content(project.name)
    click_on "Edit"
    fill_in "Name",with: "Nice"
    click_on "Edit Project"
    expect(page).to have_content("Nice")
  end
end
