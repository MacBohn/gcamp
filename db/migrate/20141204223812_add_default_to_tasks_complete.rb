class AddDefaultToTasksComplete < ActiveRecord::Migration
  def change
    Task.where(complete: nil).update_all(complete: false)
    change_column_null :tasks, :complete, false
    change_column_default :tasks, :complete, false
  end
end
