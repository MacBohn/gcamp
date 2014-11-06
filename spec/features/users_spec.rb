require 'rails_helper'

feature "Users" do

  scenario "User create users" do
    visit users_path
    expect(page).to have_content("")
