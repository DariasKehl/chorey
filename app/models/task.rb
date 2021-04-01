class Task < ApplicationRecord
    has_many :chore_list_tasks
    has_many :chore_lists, through: :chore_list_tasks
    validates :name, presence: true, length: { maximum: 15 }
  end
