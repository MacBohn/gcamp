require 'rails_helper'

feature "Tasks" do

scenario "User create tasks" do
  visit tasks_path
  expect(page).to have_content("Tasks")
  Task.create!(description:"MILK",
  due_date: "11/11/2014",
  complete: "yes")
  click_on "Create Task"
  fill_in "Description", with: "TasksName"
  fill_in "Due Date", with: "11/11/2014"
  fill_in "Complete" , with: "complete"
  click_on "Create Task"
  expect(page).to have_content("Task was successfully created")
  end
end
