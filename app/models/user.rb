class User < ApplicationRecord
    has_many :chorelist_tasks
    has_many :tasks, through: :chorelist_tasks 
    has_many :chorelists, through: :chorelist_tasks 
    has_secure_password #authenticate, validate password &/or password confirmation
  end