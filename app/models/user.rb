class User < ApplicationRecord
  has_many :loved_books, dependent: :destroy
  has_many :books, through: :loved_books
  has_many :bookmates, dependent: :destroy
  has_many :bookmate_book_categories, through: :bookmates
  has_many :selling_books, through: :bookmate_book_categories
  has_many :orders
  has_many :messages, dependent: :nullify
  has_many :loved_bookstores, dependent: :destroy

  has_attachment :photo

  validates :first_name, presence: :true

  validates :email, presence: :true, uniqueness: :true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def save_loved_books(isbn)
    loved_book_isbns = books.pluck(:isbn)
    books_to_love = Book.where(isbn: isbn).where.not(isbn: loved_book_isbns)

    books_to_love.each do |book|
      loved_books.create(book: book)
    end
  end

  def conversations
    Conversation.includes(:messages)
                .where("user1_id = :id OR user2_id = :id", id: id)
                .order("messages.created_at DESC")
  end

  def other_user(conversation)
    conversation.users.include?(self) ? conversation.other_user(self) : nil
  end

  def unread_messages
    scope = Conversation.where(user1_id: self.id).or(Conversation.where(user2_id: self.id)).map { |conversation| conversation.messages }.flatten
    scope.select { |m| m.read? }
  end

  def unread_messages_count
    unread_messages.count
  end

  def unread_messages?
    unread_messages_count > 0
  end
end
