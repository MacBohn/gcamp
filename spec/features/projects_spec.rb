require 'rails_helper'

feature "Projects" do
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


  scenario "User create project" do
    visit projects_path
    click_on "Create Project"
    fill_in "Name", with: "ProjectsName"
    click_on "Create Project"

    expect(page).to have_content("Project was successfully created")
  end


  scenario "User create project with no name" do
    visit projects_path
    click_on "Create Project"
    click_on "Create Project"
    expect(page).to have_content("Name can't be blank")
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
    click_on "Update Project"
    expect(page).to have_content("Nice")
  end
end
