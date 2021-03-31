class ChoreListTask < ApplicationRecord
  belongs_to :task
  belongs_to :chore_list
end
