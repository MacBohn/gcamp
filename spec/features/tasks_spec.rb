require 'rails_helper'

feature "Tasks" do

scenario "User create tasks" do
#CREATE
  visit tasks_path

  expect(page).to have_content("Tasks")

  click_on "Create Task"
  fill_in "Description", with: "TasksName"
  fill_in "Due Date", with: "11/11/2015"
  click_on "Create Task"
  expect(page).to have_content("Task was successfully created")
  #EDIT
  click_on "Edit"
  fill_in "Description", with: "YOYOYO"
  fill_in "Due Date", with: "12/12/2016"
  check 'Complete'
  click_on "Update Task"
  expect(page).to have_content("Task was successfully updated")
  #DESTROY
  visit tasks_path
  click_on "All"
  click_on "Destroy"
  expect(page).to have_no_content("YOYOYO")
  save_and_open_page

  end
end
