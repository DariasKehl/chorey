class ChoreList < ApplicationRecord
    has_many :chore_list_tasks
    has_many :tasks, through: :chore_list_tasks 
  end
  
