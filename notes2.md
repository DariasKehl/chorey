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

Specs:
- [X] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [] Include signup
- [] Include login
- [] Include logout
- [] Include third party signup/login (how e.g. Devise/OmniAuth)
- [] Include nested resource show or index (URL e.g. users/2/recipes)
- [] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [] Include form display of validation errors (form URL e.g. /recipes/new)
Confirm:
- [] The application is pretty DRY
- [] Limited logic in controllers
- [] Views use helper methods if appropriate
- [] Views use partials if appropriate

I can’t follow past the question I asked you Apr 6 in the nested forms lessons or labs because I don’t understand what’s happening when the console just returns an *.  

I can’t test around it with a browser because I still need help resolving the user authentication issues. 