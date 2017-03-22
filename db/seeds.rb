puts "Cleaning database..."
OrderedBook.destroy_all
Order.destroy_all
SellingBook.destroy_all
BookmateBookCategory.destroy_all
Bookmate.destroy_all
Book.destroy_all
User.destroy_all

puts "Creating users..."
quentin = User.create(email: "quentin@gmail.com", password: "azerty", first_name: "Quentin", last_name: "Coray", address: "16 villa Gaudelet Paris")
anne_sophie = User.create(email: "anne_sophie@gmail.com", password: "azerty", first_name: "Anne-Sophie", last_name: "Chambon", address: "8 rue des Boulangers Paris")
camille = User.create(email: "camille@gmail.com", password: "azerty", first_name: "Camille", last_name: "Franceschi", address: "23 boulevard Arago Paris")
jean = User.create(email: "jean@gmail.com", password: "azerty", first_name: "Jean", last_name: "Flantier", address: "7 avenue de la libération Clermont-Ferrand")
edouard = User.create(email: "edouard@gmail.com", password: "azerty", first_name: "Edouard", last_name: "Robert", address: "Donnybrook road Dublin Ireland")
alice = User.create(email: "alice@gmail.com", password: "azerty", first_name: "Alice", last_name: "Martin", address: "100 rue Oberkampf Paris")

photo_quentin = 'https://pbs.twimg.com/profile_images/618004273998249984/-46_Q9Ca.jpg'
photo_anne_sophie = 'https://avatars1.githubusercontent.com/u/25099604?v=3&s=460'
photo_camille = 'https://avatars2.githubusercontent.com/u/21193933?v=3&s=460'
photo_jean = 'http://cdn77.sadanduseless.com/wp-content/uploads/2015/05/worst9.jpg'
photo_edouard = 'http://www.goldenmoustache.com/wp-content/uploads/2015/06/worst8.jpg'
photo_alice = 'http://www.teamjimmyjoe.com/wp-content/uploads/2012/11/Bad-Family-Photos-80s-Yearbook-.jpg'

quentin.photo_url = photo_quentin
anne_sophie.photo_url = photo_anne_sophie
camille.photo_url = photo_camille
jean.photo_url = photo_jean
edouard.photo_url = photo_edouard
alice.photo_url = photo_alice


puts "Creating bookmates..."
quentin_bookstore = Bookmate.create!(description: "J'aime les bouquins zarb", deliver_by_hand: true, home_delivery: false, user: quentin)
romans_policiers = BookmateBookCategory.create!(name:"romans policiers", bookmate: quentin_bookstore)

puts "Creating books..."
book1 = Book.create!(title: "book-title", summary: "summaryjiji", author: "authoreeee", author_bio: "author_biooooo")
selling_book1 = SellingBook.create!(personalized_comment: "good", price: 19, condition: "good condition", favorite_book: false, sold: false, book: book1, bookmate_book_category: romans_policiers)
photo_book1 = 'https://www.franceculture.fr/s3/cruiser-production/2016/08/0c515c87-da57-4043-b3f6-96de8e8eaf38/738_97827436373300-3480956.jpg'
book1.photo_url = photo_book1

book2 = Book.create!(title: "Faillir être flingué", summary: "summaryjijddeefrfrgri", author: "authorcceeeeee", author_bio: "author_biooodffffoo")
selling_book2 = SellingBook.create!(personalized_comment: "very good", price: 29, condition: "very good condition", favorite_book: true, sold: false, book: book2, bookmate_book_category: romans_policiers)
photo_book2 = 'http://ecx.images-amazon.com/images/I/41o5R7NGgjL._SX210_.jpg'
book2.photo_url = photo_book2

puts "ok"
