class CreateChoreListTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :chore_list_tasks do |t|
      t.integer :chore_list_id
      t.integer :task_id

      t.timestamps
    end
  end
end
