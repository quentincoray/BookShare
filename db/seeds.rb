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
quentin_bookstore = Bookmate.create!(description: "J'aime tous types de romans, notamment les romans de fantasy, science-fiction et heroïc-fantasy. Le Seigneur des Anneaux, meilleure saga de l'histoire !", deliver_by_hand: true, home_delivery: true, user: quentin)
anne_sophie_bookstore = Bookmate.create!(description: "J'aime la littérature dans son ensemble, c'est un art passionnant qu'il me plait de partager.", deliver_by_hand: true, home_delivery: true, user: anne_sophie)
# camille_bookstore = Bookmate.create!(description: "Lectrice insatiable, je lis deux livres par semaine. J'ai chez moi une véritable bibliothèque !", deliver_by_hand: true, home_delivery: true, user: camille)
jean_bookstore = Bookmate.create!(description: "Moi c'est Jean, lecteur à mes heures perdues, mais je ne rechigne jamais à dévorer un bon bouquin.", deliver_by_hand: true, home_delivery: true, user: jean)
edouard_bookstore = Bookmate.create!(description: "J'aime les bouquins zarb", deliver_by_hand: true, home_delivery: true, user: edouard)
alice_bookstore = Bookmate.create!(description: "J'ai deux passions dans la vie : les chats et la lecture !", deliver_by_hand: true, home_delivery: true, user: alice)



puts "Creating books..."

litterature_francaise = BookmateBookCategory.create!(name:"Littérature française", bookmate: edouard_bookstore)
romans_policiers = BookmateBookCategory.create!(name:"Romans policiers", bookmate: quentin_bookstore)
bandes_dessinnees = BookmateBookCategory.create!(name:"Bandes dessinées", bookmate: quentin_bookstore)
lotr = BookmateBookCategory.create!(name:"Lord of the Rings", bookmate: quentin_bookstore)
cats = BookmateBookCategory.create!(name:"I love cats!", bookmate: alice_bookstore)
litterature_us = BookmateBookCategory.create!(name:"Littérature américaine", bookmate: anne_sophie_bookstore)
livres_francais = BookmateBookCategory.create!(name:"Mes derniers livres lus", bookmate: alice_bookstore)
last_french_awards = BookmateBookCategory.create!(name:"Derniers livres primés", bookmate: anne_sophie_bookstore)

book1 = Book.create!(title: "Le Grand Jeu", summary: "Robinson revisité", author: "Céline Minard", author_bio: "Romancière française éclectique", isbn: '9782743637323')
selling_book1 = SellingBook.create!(personalized_comment: "Donne envie de se retirer dans une bulle au fond des bois... ou pas ! ", price: 19, condition: "bon état", favorite_book: false, sold: false, book: book1, bookmate_book_category: litterature_francaise)
photo_book1 = 'https://www.franceculture.fr/s3/cruiser-production/2016/08/0c515c87-da57-4043-b3f6-96de8e8eaf38/738_97827436373300-3480956.jpg'
book1.photo_url = photo_book1

book2 = Book.create!(title: "Faillir être flingué", summary: "Western moderne", author: "Céline Minard", author_bio: "Romancière française éclectique", isbn: '9782743626563')
selling_book2 = SellingBook.create!(personalized_comment: "Super dépaysant!", price: 29, condition: "très bon état", favorite_book: true, sold: false, book: book2, bookmate_book_category: litterature_francaise)
photo_book2 = 'http://ecx.images-amazon.com/images/I/41o5R7NGgjL._SX210_.jpg'
book2.photo_url = photo_book2

book3 = Book.create!(title: "Les hommes qui n'aimaient pas les femmes", summary: "Début de la trilogie Millénium", author: "Stieg Larsson", author_bio: "Auteur suédois", isbn: '9782742761579')
selling_book3 = SellingBook.create!(personalized_comment: "very good", price: 29, condition: "très bon état", favorite_book: false, sold: false, book: book3, bookmate_book_category: romans_policiers)
photo_book3 = 'https://www.images-booknode.com/book_cover/577/full/millenium,-tome-1---les-hommes-qui-n-aimaient-pas-les-femmes-576674.jpg'
book3.photo_url = photo_book3

book4 = Book.create!(title: "Astérix le Gaulois", summary: "Super BD!", author: "Uderzo & Goscinny", author_bio: "Master of French comics", isbn:'9782012103603')
selling_book4 = SellingBook.create!(personalized_comment: "very good", price: 15, condition: "très bon état", favorite_book: true, sold: false, book: book4, bookmate_book_category: bandes_dessinnees)
photo_book4 = 'https://images-na.ssl-images-amazon.com/images/I/61oNc9DnNhL._SX378_BO1,204,203,200_.jpg'
book4.photo_url = photo_book4

book5 = Book.create!(title: "Limonov", summary: "Fantastique épopée", author: "Emmanuel Carrère", author_bio: "Auteur français", isbn: '9782818014066')
selling_book5 = SellingBook.create!(personalized_comment: "very good", price: 18, condition: "très bon état", favorite_book: true, sold: false, book: book5, bookmate_book_category: litterature_francaise)
photo_book5 = 'https://images-eu.ssl-images-amazon.com/images/I/51mq14kMy4L._SY346_.jpg'
book5.photo_url = photo_book5

book6 = Book.create!(title: "The Fellowship of the Ring", summary: "1er volet de la trilogie 'Lord of the Rings' - in VO, because it's better!", author: "J.R.R. Tolkien", author_bio: "The Master who ruled them all!", isbn: '9780547952017')
selling_book6 = SellingBook.create!(personalized_comment: "Awesome!", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book6, bookmate_book_category: lotr)
photo_book6 = 'https://images-na.ssl-images-amazon.com/images/I/41kUPvqlguL._SY346_.jpg'
book6.photo_url = photo_book6

book7 = Book.create!(title: "The Two Towers", summary: "2e volet de la trilogie 'Lord of the Rings' - still in VO, because it's still better!", author: "J.R.R. Tolkien", author_bio: "The Master who ruled them all!", isbn: '9780547952024')
selling_book7 = SellingBook.create!(personalized_comment: "Still awesome!", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book7, bookmate_book_category: lotr)
photo_book7 = 'https://images-na.ssl-images-amazon.com/images/I/41cnYEiew3L._SX304_BO1,204,203,200_.jpg'
book7.photo_url = photo_book7

book8 = Book.create!(title: "The Return of the King", summary: "Dernier volet de la trilogie 'Lord of the Rings' - still in VO, because it's still better!", author: "J.R.R. Tolkien", author_bio: "The Master who ruled them all!", isbn: '9780547952048')
selling_book8 = SellingBook.create!(personalized_comment: "Aragorn rules!", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book8, bookmate_book_category: lotr)
photo_book8 = 'https://images-na.ssl-images-amazon.com/images/I/51MlPWDaXGL._AC_UL320_SR214,320_.jpg'
book8.photo_url = photo_book8

book9 = Book.create!(title: "Le chien des Baskerville", summary: "Vous ne verrez plus la lande anglaise de la même façon....", author: "Sir Arthur Conan Doyle", author_bio: "Auteur anglais", isbn: '9782371131002')
selling_book9 = SellingBook.create!(personalized_comment: "Replongez-vous dans ce classique pendant une après-midi pluvieuse...", price: 3, condition: "bon état", favorite_book: false, sold: false, book: book9, bookmate_book_category: romans_policiers)
photo_book9 = 'https://images-na.ssl-images-amazon.com/images/I/5103MS3nyQL._SX349_BO1,204,203,200_.jpg'
book9.photo_url = photo_book9

book10 = Book.create!(title: "Simon's cat 3: in kitten chaos", summary: "Les aventures de Simon's cat, toujours aussi drôles!", author: "Simon Tofield", author_bio: "Auteur comics cool!", isbn: '9780857860835')
selling_book10 = SellingBook.create!(personalized_comment: "Replongez-vous dans ce classique pendant une après-midi pluvieuse...", price: 11, condition: "bon état", favorite_book: true, sold: false, book: book10, bookmate_book_category: cats)
photo_book10 = 'https://images-na.ssl-images-amazon.com/images/I/51cVMH6cUKL._SX258_BO1,204,203,200_.jpg'
book10.photo_url = photo_book10

book10 = Book.create!(title: "Plus je connais les hommes, plus j'aime mon chat", summary: "Des illustrations drôles et décalés faisant le parallèle entre votre homme et votre matou !", author: "Daisy Hay", author_bio: "Auteur BD qui aime les chats (comme moi!)", isbn: '9782822210768')
selling_book10 = SellingBook.create!(personalized_comment: "Très vrai!", price: 3, condition: "bon état", favorite_book: true, sold: false, book: book10, bookmate_book_category: cats)
photo_book10 = 'https://images-na.ssl-images-amazon.com/images/I/41K1oybaXaL._SX345_BO1,204,203,200_.jpg'
book10.photo_url = photo_book10

book11 = Book.create!(title: "The Goldfinch", summary: "Fantastique roman d'apprentissage, entre New York, Las Vegas et Bruxelles", author: "Donna Tartt", author_bio: "Romancière américaine", isbn: '9781405529518')
selling_book11 = SellingBook.create!(personalized_comment: "Captivant!", price: 11, condition: "très bon état", favorite_book: true, sold: false, book: book11, bookmate_book_category: litterature_us)
photo_book11 = 'https://images-na.ssl-images-amazon.com/images/I/41%2B8%2BYuhDjL._SX316_BO1,204,203,200_.jpg'
book11.photo_url = photo_book11

book12 = Book.create!(title: "Less Than Zero", summary: "Portrait d'une bande de jeunes dans le Los Angeles des années 80", author: "Bret Easton Ellis", author_bio: "Romancier contemporain", isbn: '9780307756466')
selling_book12 = SellingBook.create!(personalized_comment: "Ecriture acerbe, un roman coup de poing dans la même veine que Douglas Coupland ou Chuck Palaniuk", price: 12, condition: "bon état", favorite_book: true, sold: false, book: book12, bookmate_book_category: litterature_us)
photo_book12 = 'https://images-na.ssl-images-amazon.com/images/I/41i4iaoq%2BsL._SX328_BO1,204,203,200_.jpg'
book12.photo_url = photo_book12

selling_book13 = SellingBook.create!(personalized_comment: "Pas mal! ", price: 15, condition: "bon état", favorite_book: false, sold: false, book: book1, bookmate_book_category: livres_francais)
photo_book1 = 'https://www.franceculture.fr/s3/cruiser-production/2016/08/0c515c87-da57-4043-b3f6-96de8e8eaf38/738_97827436373300-3480956.jpg'
book1.photo_url = photo_book1

selling_book14 = SellingBook.create!(personalized_comment: "Pas mal aussi!", price: 25, condition: "très bon état", favorite_book: true, sold: false, book: book2, bookmate_book_category: livres_francais)
photo_book2 = 'http://ecx.images-amazon.com/images/I/41o5R7NGgjL._SX210_.jpg'
book2.photo_url = photo_book2

selling_book15 = SellingBook.create!(personalized_comment: "Si vous aimez le dépaysement, ce livre est pour vous!", price: 16, condition: "très bon état", favorite_book: true, sold: false, book: book1, bookmate_book_category: last_french_awards)
photo_book1 = 'https://www.franceculture.fr/s3/cruiser-production/2016/08/0c515c87-da57-4043-b3f6-96de8e8eaf38/738_97827436373300-3480956.jpg'
book1.photo_url = photo_book1

selling_book16 = SellingBook.create!(personalized_comment: "Excellent pour passer un après-midi à lire et voyager", price: 22, condition: "très bon état", favorite_book: true, sold: false, book: book2, bookmate_book_category: last_french_awards)
photo_book2 = 'http://ecx.images-amazon.com/images/I/41o5R7NGgjL._SX210_.jpg'
book2.photo_url = photo_book2

selling_book17 = SellingBook.create!(personalized_comment: "Polar Western : le mélange est possible !", price: 20, condition: "bon état", favorite_book: false, sold: false, book: book2, bookmate_book_category: romans_policiers)
photo_book2 = 'http://ecx.images-amazon.com/images/I/41o5R7NGgjL._SX210_.jpg'
book2.photo_url = photo_book2

book13 = Book.create!(title: "La Septième Fonction du Langage", summary: "Roman déjanté qui revisite la France des années 80s. Roland Barthes vient de mourir, mais est-ce vraiment un accident? ", author: "Laurent Binet", author_bio: "Auteur français contemporain", isbn: '9782246854944')
selling_book18 = SellingBook.create!(personalized_comment: "Vous ne lirez plus jamais du Barthes de la même manière!", price: 17, condition: "très bon état", favorite_book: true, sold: false, book: book13, bookmate_book_category: last_french_awards)
photo_book13 = 'http://static.fnac-static.com/multimedia/Images/FR/NR/ce/ba/6c/7125710/1507-1/tsp20150901141233/La-septieme-fonction-du-langage.jpg'
book13.photo_url = photo_book13

book14 = Book.create!(title: "D'après une histoire vraie", summary: "Comment une personne, L. peut s'immiscer dans la vie d'une personne et prendre sa place...", author: "Delphine de Vigan", author_bio: "Romancière française ", isbn: '9782709648813')
selling_book19 = SellingBook.create!(personalized_comment: "Thriller psychologique, on ne peut plus le poser tant qu'on n'est pas arrivé au dénouement....", price: 11, condition: "très bon état", favorite_book: false, sold: false, book: book14, bookmate_book_category: last_french_awards)
photo_book14 = 'https://images-na.ssl-images-amazon.com/images/I/41Bya7stsoL._SX315_BO1,204,203,200_.jpg'
book14.photo_url = photo_book14

book15 = Book.create!(title: "Réparer les vivants", summary: "Aperçu de toutes les vies qui se croisent, au propre comme au figuré, dans un hopital", author: "Maylis de Kerangal", author_bio: "Romancière française ", isbn: '9782072574795')
selling_book20 = SellingBook.create!(personalized_comment: "Ecriture dense et précise, histoire poignante, n'hésitez plus : il faut lire ce livre!", price: 4, condition: "bon état", favorite_book: false, sold: false, book: book15, bookmate_book_category: last_french_awards)
photo_book15 = 'https://images-na.ssl-images-amazon.com/images/I/41EUVx5oWQL._SX299_BO1,204,203,200_.jpg'
book15.photo_url = photo_book15

selling_book21 = SellingBook.create!(personalized_comment: "Une fantastique odyssée!", price: 17, condition: "très bon état", favorite_book: true, sold: false, book: book5, bookmate_book_category: last_french_awards)
photo_book5 = 'https://images-eu.ssl-images-amazon.com/images/I/51mq14kMy4L._SY346_.jpg'
book5.photo_url = photo_book5

puts "ok"


