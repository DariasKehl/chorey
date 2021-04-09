# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "Darias", email: "neocount@6mail.com", password: "asdf")
User.create(username: "jeff", email: "jeff@6mail.com", password: "jeff")
User.create(username: "sean", email: "sean@6mail.com", password: "sean")
User.create(username: "seamus", email: "seamus@6mail.com", password: "seamus")

Task.create(name: "Vacuum", details: "vacuum floor carpet and hardwood, moving furniture. ", task_for: "Dining Room", user_id: 2)
Task.create(name: "Clear Table", details: "School Items and old dishes", task_for: "Dining Room", user_id: 2)
Task.create(name: "Laundry", details: "Clean up laundry/shoes ", task_for: "Dining Room", user_id: 2)
Task.create(name: "Wash Windows", details: "Wash Windows inside dining room. ", task_for: "Dining Room", user_id: 2)
Task.create(name: "Wash Windows", details: "Help sean wash the windows ", task_for: "Dining Room", user_id: 3)

ChoreList.create(name: "Dining Room Daily", room: "Dining Room", user_id: 3)

ChoreListTask.create(chore_list_id: 1, task_id: 4, user_id: 2)
ChoreListTask.create(chore_list_id: 1, task_id: 5, user_id: 3)
