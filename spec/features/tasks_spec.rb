require 'rails_helper'

feature "Tasks" do
  before do
    User.delete_all
    @user = User.create!(
    email: "joe@email.com",
    password: "1234",
    first_name: "Joe",
    last_name: "Guy"
    )
    @project = Project.create!(
      name: "sweet project"
    )

    Membership.create!(
    project_id: @project.id,
    user_id: @user.id,
    role: "owner"
    )
    visit 'sign-in'
    fill_in "Email", with: "joe@email.com"
    fill_in "Password", with: "1234"
    click_on "Sign in"
  end

  scenario "User create tasks" do
    #CREATE
    visit project_tasks_path(@project)

    expect(page).to have_content("Tasks")

    click_on "Create Task"
    fill_in "Description", with: "TasksName"
    fill_in 'Due date', with: "11/11/2015"
    click_on "Create Task"
    expect(page).to have_content("Task was successfully created")
    #EDIT
    click_on "Edit"
    fill_in "Description", with:"YOYOYO"
    fill_in "Due date", with: "12/12/2016"
    check 'Complete'
    click_on "Update Task"
    save_and_open_page
    expect(page).to have_content("Task was successfully updated")

    #DESTROY
    # 
    # visit project_tasks_path(@project)
    # click_on "All"
    # click_on "Destroy"
    # expect(page).to have_no_content("YOYOYO")

  end
end
