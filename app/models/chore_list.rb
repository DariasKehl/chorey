class ChoreList < ApplicationRecord
    has_many :chore_list_tasks
    has_many :tasks, through: :chore_list_tasks
    accepts_nested_attributes_for :tasks
     

    # create_table "chore_lists", force: :cascade do |t|
    #   t.string   "name"
    #   t.string   "room"
    #   t.integer  "user_id"
    
  end
  
