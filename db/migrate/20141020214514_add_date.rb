class AddDate < ActiveRecord::Migration
  def change
    add_column :tasks, :date, :boolean
  end
end
