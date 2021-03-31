class Task < ApplicationRecord

#     Individual task on a ChoreList
#     Name - String
#     Details - text block
     
    has_many :chore_list_tasks
    has_many :chore_lists, through: :chore_list_tasks
    belongs_to :user
    
    validates :name, presence: true, length: { maximum: 3 }
    #MOP -- (Archer reference?  no? )
    #using_strong_params
end
