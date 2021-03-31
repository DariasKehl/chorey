class User
  has_many :tasks
  has_many :chorelists
end
class ChoreListTask
  belongs_to :task
  belongs_to :chorelist
end 
class Task
  has_many :chorelist_tasks
  has_many :chorelists, through: :chorelist_tasks
  belongs_to :user 
end 
class ChoreList
  has_many :chorelist_tasks
  has_many :tasks, through: :chorelist_tasks
  belongs_to :user 
end 