class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :details
      t.string :task_for
      t.integer :user_id

      t.timestamps
    end
  end
end
