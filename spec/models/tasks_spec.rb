require 'rails_helper'

  describe "tasks" do

  it "validates the presence of the due date" do
    task = Task.new(
    description: "yo",
    due_date: "11/11/3014")
    task.valid?
    expect(task.errors[:due_date].present?).to eq(false)
  end
  it "validates the presence of the due date" do
    task = Task.create(
    description: "yo",
    due_date: "11/11/3012")
    task.update(description: "yoyo",
    due_date: "11/11/1011")
    task.valid?
    expect(task.errors[:due_date].present?).to eq(false)
  end
  it "validates the lack of the due date" do
    task = Task.new(
    description: "yo",
    due_date: "11/11/1014")
    task.valid?
    expect(task.errors[:due_date].present?).to eq(true)
  end

end
