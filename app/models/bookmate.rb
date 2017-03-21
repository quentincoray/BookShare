class Bookmate < ApplicationRecord
  belongs_to :user
  has_many :bookmate_book_categories, dependent: :destroy
  has_many :selling_books,through: :bookmate_book_categories, dependent: :destroy
  has_many :books, through: :selling_books
  has_many :orders, dependent: :destroy


  validates :description, presence: :true
  validates :deliver_by_hand, inclusion: { in: [ true, false ] }
  validates :home_delivery, inclusion: { in: [ true, false ] }

end
