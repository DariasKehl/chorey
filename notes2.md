ActiveRecord::Schema.define(version: 20210331215359) do
  create_table "chore_list_tasks", force: :cascade do |t|
    t.integer  "chore_list_id"
    t.integer  "task_id"
    t.string   "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end
  create_table "chore_lists", force: :cascade do |t|
    t.string   "name"
    t.string   "room"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.text     "details"
    t.string   "task_for"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end
end

Classes:

class User < ApplicationRecord
  has_many :chorelist_tasks
  has_many :tasks, through: :chorelist_tasks 
  has_many :chorelists, through: :chorelist_tasks 
  has_secure_password #authenticate, validate password &/or password confirmation
end
class Task < ApplicationRecord
  has_many :chore_list_tasks
  has_many :chore_lists, through: :chore_list_tasks
  validates :name, presence: true, length: { maximum: 15 }
end
class ChoreList < ApplicationRecord
  has_many :chore_list_tasks
  has_many :tasks, through: :chore_list_tasks 
end
class ChoreListTask < ApplicationRecord
  belongs_to :chore_list
  belongs_to :task
  belongs_to :user
end