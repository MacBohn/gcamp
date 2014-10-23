class AddCheckbox < ActiveRecord::Migration
  def change
    add_column :tasks, :complete, :boolean, default: false, nil:false
  end
end
