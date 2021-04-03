class Task < ApplicationRecord
    has_many :chore_list_tasks
    has_many :chore_lists, through: :chore_list_tasks
    validates :name, presence: true, length: { maximum: 15 }
    validates :details, presence: true 
    #Clever persons would have regex email pattern matching [ A + @ + B + . + C]
    #Extra clever would strip anything after "+" in the A string. 

    def user_isCalled
      User.find_by_id(self.user_id).username
    end
  end
