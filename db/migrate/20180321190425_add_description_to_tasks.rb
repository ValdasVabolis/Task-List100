class AddDescriptionToTasks < ActiveRecord::Migration[5.1]
  def change
    add_column :tasks, :description, :string, null: false, default: ''
  end
end
