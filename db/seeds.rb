# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


SellingBook.destroy_all
BookmateBookCategory.destroy_all
Bookmate.destroy_all
Book.destroy_all
User.destroy_all

quentin = User.create(email: "quentin@gmail.com", password: "azerty", first_name: "Quentin", last_name: "Coray")
anne_sophie = User.create(email: "anne_sophie@gmail.com", password: "azerty", first_name: "Anne-Sophie", last_name: "Chambon")
camille = User.create(email: "camille@gmail.com", password: "azerty", first_name: "Camille", last_name: "Franceschi")
jean = User.create(email: "jean@gmail.com", password: "azerty", first_name: "Jean", last_name: "Flantier")
edouard = User.create(email: "edouard@gmail.com", password: "azerty", first_name: "Edouard", last_name: "Robert")
alice = User.create(email: "alice@gmail.com", password: "azerty", first_name: "Alice", last_name: "Martin")

quentin_bookstore = Bookmate.create!(description: "J'aime les bouquins zarb", deliver_by_hand: true, home_delivery: false, user: quentin)

romans_policiers = BookmateBookCategory.create!(name:"romans policiers", bookmate: quentin_bookstore)

book1 = Book.create!(title: "book-title", summary: "summaryjiji", author: "authoreeee", author_bio: "author_biooooo")
selling_book1 = SellingBook.create!(personalized_comment: "good", price: 19, condition: "good condition", favorite_book: false, sold: false, book: book1, bookmate_book_category: romans_policiers)
photo_book1 = 'https://www.franceculture.fr/s3/cruiser-production/2016/08/0c515c87-da57-4043-b3f6-96de8e8eaf38/738_97827436373300-3480956.jpg'
book1.photo_url = photo_book1

book2 = Book.create!(title: "Faillir être flingué", summary: "summaryjijddeefrfrgri", author: "authorcceeeeee", author_bio: "author_biooodffffoo")
selling_book2 = SellingBook.create!(personalized_comment: "very good", price: 29, condition: "very good condition", favorite_book: true, sold: false, book: book2, bookmate_book_category: romans_policiers)
photo_book2 = 'http://ecx.images-amazon.com/images/I/41o5R7NGgjL._SX210_.jpg'
book2.photo_url = photo_book2

puts "ok"
