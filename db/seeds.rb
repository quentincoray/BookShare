# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Bookmate.destroy_all
Book.destroy_all
SellingBook.destroy_all

quentin = User.create(email: "quentin@gmail.com", password: "azerty", first_name: "Quentin", last_name: "Coray")
anne_sophie = User.create(email: "anne_sophie@gmail.com", password: "azerty", first_name: "Anne-Sophie", last_name: "Chambon")
camille = User.create(email: "camille@gmail.com", password: "azerty", first_name: "Camille", last_name: "Franceschi")
jean = User.create(email: "jean@gmail.com", password: "azerty", first_name: "Jean", last_name: "Flantier")
edouard = User.create(email: "edouard@gmail.com", password: "azerty", first_name: "Edouard", last_name: "Robert")
alice = User.create(email: "alice@gmail.com", password: "azerty", first_name: "Alice", last_name: "Martin")

quentin_bookstore = Bookmate.create(description: "J'aime les bouquins zarb", book_category: "romans policiers", deliver_by_hand: true, home_delivery: false, user: quentin)
book1 = Book.create!(title: "book-title", summary: "summaryjiji", author: "authoreeee", author_bio: "author_biooooo")
selling_book1 = SellingBook.create!(personalized_comment: "good", price: 19, condition: "good condition", favorite_book: false, sold:"false", bookmate: quentin_bookstore , book: book1)


puts "ok"
