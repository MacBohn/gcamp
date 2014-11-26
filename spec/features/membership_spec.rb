require 'rails_helper'

feature "Membership" do
    scenario "User adds member to a project" do

      project = create_project (name: "YOOOOO")

      create_user (first_name: "Mark",last_name: "Jones",)
      visit project_path(project)
      click_on "Members"

end
end
