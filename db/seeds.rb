# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

quentin = User.create(email: "quentin@gmail.com", password: "azerty")
anne_sophie = User.create(email: "anne_sophie@gmail.com", password: "azerty")
camille = User.create(email: "camille@gmail.com", password: "azerty")
jean = User.create(email: "jean@gmail.com", password: "azerty")
edouard = User.create(email: "edouard@gmail.com", password: "azerty")
alice = User.create(email: "alice@gmail.com", password: "azerty")

quentin_bookstore = Bookmate.create!(description: "J'aime les bouquins zarb", book_category: "romans policiers", deliver_by_hand: true, home_delivery: false, user: anne_sophie)
puts "ok"
