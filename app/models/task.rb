class Task < ApplicationRecord

#     Individual task on a ChoreList
#     Name - String
#     Details - text block
#     
# 
# 
# 
# 
# 
# 
# 

    belongs_to :user
    belongs_to :chorelist
    validates :name, presence: true, length: { maximum: 1 }
    #using_strong_params
end
