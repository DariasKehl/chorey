class AddCompleteToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :complete, :boolean, null: false, default: false
  end
end
