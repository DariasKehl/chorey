class User < ApplicationRecord
    has_many :chore_list_tasks
    has_many :tasks, through: :chore_list_tasks 
    has_many :chore_lists, through: :chore_list_tasks 
    
    has_secure_password #authenticate, validate password &/or password confirmation
  end