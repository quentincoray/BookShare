# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Bookmate.destroy_all


user1 = User.create!(first_name: "Camille", email: 'camille@gmail.com', password:'azerty', address: "16 villa Gaudelet Paris")
user2 = User.create!(first_name: "Quentin", email: 'quention@gmail.com', password:'azerty', address: "8 rue des Boulangers Paris")
user3 = User.create!(first_name: "Julien", email: 'julien@gmail.com', password:'azerty', address: "6 rue du hameau Yzeure")

bookmates = Bookmate.create!([
  {description: 'French lit', home_delivery: true, deliver_by_hand: true, user: user1},
  {description: 'English lit', home_delivery: true, deliver_by_hand: true, user: user2},
  {description: 'Spanish lit', home_delivery: true, deliver_by_hand: true, user: user3}
])

puts 'seed ok'
