class CreateChoreLists < ActiveRecord::Migration[5.0]
  def change
    create_table :chore_lists do |t|
      t.string :name
      t.string :room
      t.integer :user_id
      
      t.timestamps
    end
  end
end
