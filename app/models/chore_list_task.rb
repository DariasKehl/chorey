class ChoreListTask < ApplicationRecord
  belongs_to :chore_list
  belongs_to :task
  belongs_to :user
end