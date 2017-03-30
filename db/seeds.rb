puts "Cleaning database..."
LovedBookstore.destroy_all
LovedBook.destroy_all
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
jean = User.create(email: "jean@gmail.com", password: "azerty", first_name: "Jean", last_name: "Flantier", address: "7 avenue de Saxe Paris")
edouard = User.create(email: "edouard@gmail.com", password: "azerty", first_name: "Edouard", last_name: "Robert", address: "16, rue d'Ulm Paris")
alice = User.create(email: "alice@gmail.com", password: "azerty", first_name: "Alice", last_name: "Martin", address: "100 rue Oberkampf Paris")


photo_quentin = 'https://pbs.twimg.com/profile_images/618004273998249984/-46_Q9Ca.jpg'
photo_anne_sophie = 'https://avatars1.githubusercontent.com/u/25099604?v=3&s=460'
photo_camille = 'https://avatars2.githubusercontent.com/u/21193933?v=3&s=460'
photo_jean = 'https://pbs.twimg.com/profile_images/662333810185543680/0NdNCnYu.jpg'
photo_edouard = 'https://s-media-cache-ak0.pinimg.com/originals/a6/70/b6/a670b6579ac8de3142a40e5de7217ad0.jpg'
photo_alice = 'http://www.teamjimmyjoe.com/wp-content/uploads/2012/11/Bad-Family-Photos-80s-Yearbook-.jpg'

quentin.photo_url = photo_quentin
anne_sophie.photo_url = photo_anne_sophie
camille.photo_url = photo_camille
jean.photo_url = photo_jean
edouard.photo_url = photo_edouard
alice.photo_url = photo_alice


puts "Creating bookmates..."
quentin_bookstore = Bookmate.create!(description: "J'aime tous types de romans, surtout les romans français contemporains, et parfois je me détends avec une BD", deliver_by_hand: true, home_delivery: true, user: quentin)
anne_sophie_bookstore = Bookmate.create!(description: "J'aime la littérature dans son ensemble, c'est un art passionnant qu'il me plait de partager.", deliver_by_hand: true, home_delivery: false, user: anne_sophie)
# camille_bookstore = Bookmate.create!(description: "Lectrice insatiable, je lis deux livres par semaine. J'ai chez moi une véritable bibliothèque !", deliver_by_hand: true, home_delivery: true, user: camille)
jean_bookstore = Bookmate.create!(description: "Moi c'est Jean, je tourne dans quelques films, entre Paris et Hollywood, mais je ne rechigne jamais à dévorer un bon bouquin.", deliver_by_hand: true, home_delivery: true, user: jean)
edouard_bookstore = Bookmate.create!(description: "Vous savez, je ne pense pas qu'il y a de bon ou de mauvais livre...", deliver_by_hand: true, home_delivery: true, user: edouard)
alice_bookstore = Bookmate.create!(description: "J'ai deux passions dans la vie : les chats et la lecture !", deliver_by_hand: true, home_delivery: true, user: alice)



puts "Creating books..."

last_french_awards = BookmateBookCategory.create!(name:"Derniers livres primés", bookmate: quentin_bookstore)
litterature_francaise = BookmateBookCategory.create!(name:"Littérature française", bookmate: edouard_bookstore)
romans_policiers = BookmateBookCategory.create!(name:"Romans policiers", bookmate: quentin_bookstore)
bandes_dessinnees = BookmateBookCategory.create!(name:"Bandes dessinées", bookmate: quentin_bookstore)
lotr = BookmateBookCategory.create!(name:"Lord of the Rings", bookmate: quentin_bookstore)
cats = BookmateBookCategory.create!(name:"I love cats!", bookmate: alice_bookstore)
litterature_us = BookmateBookCategory.create!(name:"Littérature américaine", bookmate: anne_sophie_bookstore)
livres_francais = BookmateBookCategory.create!(name:"Mes derniers livres lus", bookmate: alice_bookstore)
nouveautes = BookmateBookCategory.create!(name:"Derniers livres lus", bookmate: anne_sophie_bookstore)
derniers_achats = BookmateBookCategory.create!(name:"Mes derniers achats", bookmate: jean_bookstore)

book1 = Book.create!(title: "Le Grand Jeu", summary: "Robinson revisité", author: "Céline Minard", author_bio: "Romancière française éclectique", isbn: '9782743637323')
photo_book1 = 'https://www.franceculture.fr/s3/cruiser-production/2016/08/0c515c87-da57-4043-b3f6-96de8e8eaf38/738_97827436373300-3480956.jpg'
book1.photo_url = photo_book1

book2 = Book.create!(title: "Faillir être flingué", summary: "Western moderne", author: "Céline Minard", author_bio: "Romancière française éclectique", isbn: '9782743626563')
# Photo a changer
photo_book2 = 'https://images-na.ssl-images-amazon.com/images/I/41A4ZJV1fNL._SX323_BO1,204,203,200_.jpg'
book2.photo_url = photo_book2

book3 = Book.create!(title: "Les hommes qui n'aimaient pas les femmes", summary: "Début de la trilogie Millénium", author: "Stieg Larsson", author_bio: "Auteur suédois", isbn: '9782742761579')
photo_book3 = 'https://www.images-booknode.com/book_cover/577/full/millenium,-tome-1---les-hommes-qui-n-aimaient-pas-les-femmes-576674.jpg'
book3.photo_url = photo_book3

book4 = Book.create!(title: "Astérix le Gaulois", summary: "Super BD!", author: "Uderzo & Goscinny", author_bio: "Master of French comics", isbn:'9782012103603')
photo_book4 = 'https://images-na.ssl-images-amazon.com/images/I/61oNc9DnNhL._SX378_BO1,204,203,200_.jpg'
book4.photo_url = photo_book4

book5 = Book.create!(title: "Limonov", summary: "Fantastique épopée", author: "Emmanuel Carrère", author_bio: "Auteur français", isbn: '9782818014066')
photo_book5 = 'https://images-eu.ssl-images-amazon.com/images/I/51mq14kMy4L._SY346_.jpg'
book5.photo_url = photo_book5

book6 = Book.create!(title: "The Fellowship of the Ring", summary: "1er volet de la trilogie 'Lord of the Rings' - in VO, because it's better!", author: "J.R.R. Tolkien", author_bio: "The Master who ruled them all!", isbn: '9780547952017')
photo_book6 = 'https://images-na.ssl-images-amazon.com/images/I/41kUPvqlguL._SY346_.jpg'
book6.photo_url = photo_book6

book7 = Book.create!(title: "The Two Towers", summary: "2e volet de la trilogie 'Lord of the Rings' - still in VO, because it's still better!", author: "J.R.R. Tolkien", author_bio: "The Master who ruled them all!", isbn: '9780547952024')
photo_book7 = 'https://images-na.ssl-images-amazon.com/images/I/41cnYEiew3L._SX304_BO1,204,203,200_.jpg'
book7.photo_url = photo_book7

book8 = Book.create!(title: "The Return of the King", summary: "Dernier volet de la trilogie 'Lord of the Rings' - still in VO, because it's still better!", author: "J.R.R. Tolkien", author_bio: "The Master who ruled them all!", isbn: '9780547952048')
photo_book8 = 'https://images-na.ssl-images-amazon.com/images/I/51MlPWDaXGL._AC_UL320_SR214,320_.jpg'
book8.photo_url = photo_book8

book9 = Book.create!(title: "Le chien des Baskerville", summary: "Vous ne verrez plus la lande anglaise de la même façon....", author: "Sir Arthur Conan Doyle", author_bio: "Auteur anglais", isbn: '9782371131002')
photo_book9 = 'https://images-na.ssl-images-amazon.com/images/I/5103MS3nyQL._SX349_BO1,204,203,200_.jpg'
book9.photo_url = photo_book9

book10 = Book.create!(title: "Simon's cat 3: in kitten chaos", summary: "Les aventures de Simon's cat, toujours aussi drôles!", author: "Simon Tofield", author_bio: "Auteur comics cool!", isbn: '9780857860835')
photo_book10 = 'https://images-na.ssl-images-amazon.com/images/I/51cVMH6cUKL._SX258_BO1,204,203,200_.jpg'
book10.photo_url = photo_book10

book11 = Book.create!(title: "Plus je connais les hommes, plus j'aime mon chat", summary: "Des illustrations drôles et décalés faisant le parallèle entre votre homme et votre matou !", author: "Daisy Hay", author_bio: "Auteur BD qui aime les chats (comme moi!)", isbn: '9782822210768')
photo_book11 = 'https://images-na.ssl-images-amazon.com/images/I/41K1oybaXaL._SX345_BO1,204,203,200_.jpg'
book11.photo_url = photo_book11

book12 = Book.create!(title: "The Goldfinch", summary: "Fantastique roman d'apprentissage, entre New York, Las Vegas et Bruxelles", author: "Donna Tartt", author_bio: "Romancière américaine", isbn: '9781405529518')
photo_book12 = 'https://images-na.ssl-images-amazon.com/images/I/41%2B8%2BYuhDjL._SX316_BO1,204,203,200_.jpg'
book12.photo_url = photo_book12

book13 = Book.create!(title: "Less Than Zero", summary: "Portrait d'une bande de jeunes dans le Los Angeles des années 80", author: "Bret Easton Ellis", author_bio: "Romancier contemporain", isbn: '9780307756466')
photo_book13 = 'https://images-na.ssl-images-amazon.com/images/I/41i4iaoq%2BsL._SX328_BO1,204,203,200_.jpg'
book13.photo_url = photo_book13

book14 = Book.create!(title: "L'insoutenable légèreté de l'être", summary: "Qu'est-il resté des agonisants du Cambodge ? Une grande photo de la star américaine tenant dans ses bras un enfant jaune. Qu'est-il resté de Tomas ? Une inscription : Il voulait le Royaume de Dieu sur la terre. Qu'est-il resté de Beethoven ? Un homme morose à l'invraisemblable crinière, qui prononce d'une voix sombre : Es muss sein ! Qu'est-il resté de Franz ? Une inscription : Après un long égarement, le retour. Et ainsi de suite, et ainsi de suite. Avant d'être oubliés, nous serons changés en kitsch. Le kitsch, c'est la station de correspondance entre l'être et l'oubli.", author: "Milan Kundera", isbn: '207038165X')
photo_book14 = 'https://images-na.ssl-images-amazon.com/images/I/51xot076dTL._SX302_BO1,204,203,200_.jpg'
book14.photo_url = photo_book14

book15 = Book.create!(title: "Banquises", author: "Valentine Goby", isbn: '9782226229878')
photo_book15 = 'https://images-na.ssl-images-amazon.com/images/I/41e04O%2BH-ZL._SX307_BO1,204,203,200_.jpg'
book15.photo_url = photo_book15


# A retraiter
book24 = Book.create!(title: "La Septième Fonction du Langage", summary: "Roman déjanté qui revisite la France des années 80s. Roland Barthes vient de mourir, mais est-ce vraiment un accident? ", author: "Laurent Binet", author_bio: "Auteur français contemporain", isbn: '9782246854944')
photo_book24 = 'http://static.fnac-static.com/multimedia/Images/FR/NR/ce/ba/6c/7125710/1507-1/tsp20150901141233/La-septieme-fonction-du-langage.jpg'
book24.photo_url = photo_book24

book22 = Book.create!(title: "D'après une histoire vraie", summary: "Comment une personne, L. peut s'immiscer dans la vie d'une personne et prendre sa place...", author: "Delphine de Vigan", author_bio: "Romancière française ", isbn: '9782709648813')
photo_book22 = 'https://images-na.ssl-images-amazon.com/images/I/41Bya7stsoL._SX315_BO1,204,203,200_.jpg'
book22.photo_url = photo_book22

book23 = Book.create!(title: "Réparer les vivants", summary: "Aperçu de toutes les vies qui se croisent, au propre comme au figuré, dans un hopital", author: "Maylis de Kerangal", author_bio: "Romancière française ", isbn: '9782072574795')
photo_book23 = 'https://images-na.ssl-images-amazon.com/images/I/41EUVx5oWQL._SX299_BO1,204,203,200_.jpg'
book23.photo_url = photo_book23



selling_book1 = SellingBook.create!(personalized_comment: "Donne envie de se retirer dans une bulle au fond des bois... ou pas ! ", price: 19, condition: "bon état", favorite_book: false, sold: false, book: book1, bookmate_book_category: litterature_francaise)
selling_book2 = SellingBook.create!(personalized_comment: "Super dépaysant!", price: 29, condition: "très bon état", favorite_book: true, sold: false, book: book2, bookmate_book_category: litterature_francaise)
selling_book3 = SellingBook.create!(personalized_comment: "very good", price: 29, condition: "très bon état", favorite_book: false, sold: false, book: book3, bookmate_book_category: romans_policiers)
selling_book4 = SellingBook.create!(personalized_comment: "very good", price: 15, condition: "très bon état", favorite_book: true, sold: false, book: book4, bookmate_book_category: bandes_dessinnees)
selling_book5 = SellingBook.create!(personalized_comment: "very good", price: 18, condition: "très bon état", favorite_book: true, sold: false, book: book5, bookmate_book_category: litterature_francaise)
selling_book6 = SellingBook.create!(personalized_comment: "Awesome!", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book6, bookmate_book_category: lotr)
selling_book7 = SellingBook.create!(personalized_comment: "Still awesome!", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book7, bookmate_book_category: lotr)
selling_book8 = SellingBook.create!(personalized_comment: "Aragorn rules!", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book8, bookmate_book_category: lotr)
selling_book9 = SellingBook.create!(personalized_comment: "Replongez-vous dans ce classique pendant une après-midi pluvieuse...", price: 3, condition: "bon état", favorite_book: false, sold: false, book: book9, bookmate_book_category: romans_policiers)
selling_book10 = SellingBook.create!(personalized_comment: "Replongez-vous dans ce classique pendant une après-midi pluvieuse...", price: 11, condition: "bon état", favorite_book: true, sold: false, book: book10, bookmate_book_category: cats)
selling_book11 = SellingBook.create!(personalized_comment: "Très vrai!", price: 3, condition: "bon état", favorite_book: true, sold: false, book: book11, bookmate_book_category: cats)
selling_book12 = SellingBook.create!(personalized_comment: "Captivant!", price: 11, condition: "très bon état", favorite_book: true, sold: false, book: book12, bookmate_book_category: litterature_us)
selling_book13 = SellingBook.create!(personalized_comment: "Ecriture acerbe, un roman coup de poing dans la même veine que Douglas Coupland ou Chuck Palaniuk", price: 12, condition: "bon état", favorite_book: true, sold: false, book: book13, bookmate_book_category: litterature_us)
selling_book14 = SellingBook.create!(personalized_comment: "Faut-il lire Kundera? Oui, il le faut! Ja, es muss sein! Ne serait-ce que pour suivre l'histoire d'amour entre Tomas et Tereza. Lui est un libertin (c'est le côté léger développé dans ce roman et que possède aussi l'une de ses maîtresses, l'artiste Sabrina) mais il est torturé par la douleur insoutenable qu'il génère pour son couple, surtout pour Tereza, déjà marquée par l'éducation et les vexations de sa mère. de lourds fardeaux pour elle.", price: 12, condition: "bon état", favorite_book: true, sold: false, book: book14, bookmate_book_category: litterature_francaise)
selling_book15 = SellingBook.create!(personalized_comment: "Une histoire émouvante de disparition d'une jeune fille Sarah, partie dans le Grand Nord et qui n'est jamais rentrée.Désarroi des parents qui luttent chacun de leur façon, le père pudiquement, presque secrètement contrairement à la mère qui déploie toute son energie à la recherche de sa fille , attente qui devient obsessionnelle mais comment lui reprocher ce qui devient le seul but de son existence.", price: 12, condition: "bon état", favorite_book: true, sold: false, book: book15, bookmate_book_category: litterature_francaise)
selling_book16 = SellingBook.create!(personalized_comment: "Pas mal! ", price: 15, condition: "bon état", favorite_book: false, sold: false, book: book1, bookmate_book_category: livres_francais)
selling_book17 = SellingBook.create!(personalized_comment: "Pas mal aussi!", price: 25, condition: "très bon état", favorite_book: true, sold: false, book: book2, bookmate_book_category: livres_francais)
selling_book18 = SellingBook.create!(personalized_comment: "Si vous aimez le dépaysement, ce livre est pour vous!", price: 16, condition: "très bon état", favorite_book: true, sold: false, book: book1, bookmate_book_category: last_french_awards)
selling_book19 = SellingBook.create!(personalized_comment: "Excellent pour passer un après-midi à lire et voyager", price: 22, condition: "très bon état", favorite_book: true, sold: false, book: book2, bookmate_book_category: last_french_awards)
selling_book20 = SellingBook.create!(personalized_comment: "Polar Western : le mélange est possible !", price: 20, condition: "bon état", favorite_book: false, sold: false, book: book2, bookmate_book_category: romans_policiers)
selling_book21 = SellingBook.create!(personalized_comment: "Vous ne lirez plus jamais du Barthes de la même manière!", price: 17, condition: "très bon état", favorite_book: true, sold: false, book: book13, bookmate_book_category: last_french_awards)
selling_book25 = SellingBook.create!(personalized_comment: "Thriller psychologique, on ne peut plus le poser tant qu'on n'est pas arrivé au dénouement....", price: 11, condition: "très bon état", favorite_book: false, sold: false, book: book14, bookmate_book_category: last_french_awards)
selling_book26 = SellingBook.create!(personalized_comment: "Ecriture dense et précise, histoire poignante, n'hésitez plus : il faut lire ce livre!", price: 4, condition: "bon état", favorite_book: false, sold: false, book: book15, bookmate_book_category: last_french_awards)
selling_book27 = SellingBook.create!(personalized_comment: "Très bon livre, si vous avez aimé Céline Minard, ce livre vous plaira", price: 17, condition: "très bon état", favorite_book: true, sold: false, book: book23, bookmate_book_category: last_french_awards)
selling_book28 = SellingBook.create!(personalized_comment: "Encore une très belle découverte de cette romancière", price: 17, condition: "très bon état", favorite_book: true, sold: false, book: book22, bookmate_book_category: last_french_awards)
selling_book29 = SellingBook.create!(personalized_comment: "Intéressante découverte", price: 15, condition: "bon état", favorite_book: true, sold: false, book: book22, bookmate_book_category: nouveautes)
selling_book30 = SellingBook.create!(personalized_comment: "Je ne connaissais pas Céline Minard, mais ce livre m'a convaincu", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book1, bookmate_book_category: nouveautes)
selling_book31 = SellingBook.create!(personalized_comment: "Livre haletant", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book22, bookmate_book_category: derniers_achats)
selling_book32 = SellingBook.create!(personalized_comment: "Très poignant!", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book23, bookmate_book_category: derniers_achats)
selling_book33 = SellingBook.create!(personalized_comment: "Livre haletant", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book22, bookmate_book_category: livres_francais)
selling_book34 = SellingBook.create!(personalized_comment: "Très poignant!", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book23, bookmate_book_category: livres_francais)
selling_book35 = SellingBook.create!(personalized_comment: "Fantastique", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book5, bookmate_book_category: derniers_achats)
selling_book36 = SellingBook.create!(personalized_comment: "J'ai vraiment adoré ce livre", price: 10, condition: "bon état", favorite_book: true, sold: false, book: book5, bookmate_book_category: livres_francais)

puts "Creating conversations..."
# c1 = Conversation.create!(user1: quentin, user2: anne_sophie)
c2 = Conversation.create!(user1: quentin, user2: camille)
# c3 = Conversation.create!(user1: alice, user2: camille)
c4 = Conversation.create!(user1: camille, user2: anne_sophie)
# c5 = Conversation.create!(user1: quentin, user2: edouard)
# c6 = Conversation.create!(user1: alice, user2: quentin)


puts "Creating messages..."
# m1 = Message.create!(user: quentin, conversation: c1, content: "Besoin de conseils en littérature américaine")
# m2 = Message.create!(user: camille, conversation: c2, content: "Est-ce que tu vends toujours 'Réparer les Vivants' ?")
# m3 = Message.create!(user: camille, conversation: c3, content: "Tu préfères les chats ou la littérature ?")
# m4 = Message.create!(user: anne_sophie, conversation: c1, content: "Salut Quentin, avec plaisir pour te conseiller! Tu peux m'en dire plus sur tes goûts ?")
# m5 = Message.create!(user: anne_sophie, conversation: c2, content: "Hello Camille, je te confirme que le livre est toujours à vendre (et qu'il est vraiment très bien !) Intéressée ?")
# m6 = Message.create!(user: alice, conversation: c3, content: "Je préfère les chats, j'en ai 10 chez moi. D'ailleurs si tu veux je peux t'en prêter un. Et si tu veux faire garder ton chat, regarde sur Easyc@t, super site!")
# m7 = Message.create!(user: camille, conversation: c4, content: "Quentin, il faut que ça CSS.... ")
# m8 = Message.create!(user: quentin, conversation: c5, content: "Salut Edouard, tu connais les avocats ?")
# m9 = Message.create!(user: alice, conversation: c6, content: "Hello, tu as des BD à me conseiller qui mettent en scène des chats ?")
# m10 = Message.create!(user: quentin, conversation: c4, content: "Non, on est sur les Rails, il faut avancer !")
# m11 = Message.create!(user: edouard, conversation: c5, content: "Non.... mais j'ai de la chance, c'est ça ?")
# m12 = Message.create!(user: quentin, conversation: c6, content: "Tu peux lire 'Le Chat du Rabbin', c'est très chouette !")
m13 = Message.create!(user: quentin, conversation: c2, content: "Merci pour cette commande!")
m14 = Message.create!(user: anne_sophie, conversation: c4, content: "Merci d'avoir passé commande chez moi! On se retrouve Place d'Italie pour la remise en main propre?")
m15 = Message.create!(user: camille, conversation: c4, content: "Parfait pour moi! J'y serai demain à 16h, devant la sortie du métro. On pourra prendre un café à côté pour parler du livre")


puts "Creating loved books..."

# camille_loved_book1 = LovedBook.create!(user: camille, book: book1)
# camille_loved_book2 = LovedBook.create!(user: camille, book: book2)
# camille_loved_book3 = LovedBook.create!(user: camille, book: book5)
quentin_loved_book1 = LovedBook.create!(user: quentin, book: book3)
quentin_loved_book2 = LovedBook.create!(user: quentin, book: book8)
quentin_loved_book3 = LovedBook.create!(user: quentin, book: book11)
anne_sophie_loved_book1 = LovedBook.create!(user: anne_sophie, book: book4)
anne_sophie_loved_book2 = LovedBook.create!(user: anne_sophie, book: book9)
anne_sophie_loved_book3 = LovedBook.create!(user: anne_sophie, book: book14)
jean_loved_book1 = LovedBook.create!(user: jean, book: book10)
jean_loved_book2 = LovedBook.create!(user: jean, book: book12)
alice_loved_book1 = LovedBook.create!(user: alice, book: book12)
alice_loved_book2 = LovedBook.create!(user: alice, book: book15)
edouard_loved_book1 = LovedBook.create!(user: edouard, book: book14)

puts "Creating loved booksmates..."

camille_loved_bookmate1 = LovedBookstore.create!(user: camille, bookmate: quentin_bookstore)

puts "Creating orders..."
order1 = Order.create!(user: camille, bookmate: anne_sophie_bookstore, order_status: 'paid', delivery_status: 'effectuée', delivery_type: 'Livraison en main propre', review: 'Livre en excellent état, discussion sympa, je recommande', rating: 5)
order2 = Order.create!(user: alice, bookmate: quentin_bookstore, order_status: 'paid', delivery_status: 'effectuée', delivery_type: 'Livraison en main propre', review: 'Top', rating: 5)

puts "Ordered Books"
ordered_book1 = OrderedBook.create!(order: order1, selling_book: selling_book12)
ordered_book2 = OrderedBook.create!(order: order2, selling_book: selling_book9)

puts "ok"


