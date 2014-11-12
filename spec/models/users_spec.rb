require 'rails_helper'

  describe "users" do

  it "validates the presence of the email" do
    users = User.new(
    email: "yo@yo.com",
    password: "yo"
    )
    users.valid?
    expect(users.errors[:email].present?).to eq(false)
  end

  it "validates the uniqueness of the email" do
    User.create!(
    first_name: "MAC",
    last_name: "BOHN",
    email: "mac@aol.com",
    password: "yo")
    users = User.new
    users.email = "mac@aol.com"
    users.valid?
    expect(users.errors[:email].present?).to eq(true)

    users.email = "mccartney@yahoo.com"
    users.valid?
    expect(users.errors[:name].present?).to eq(false)


  end
end
