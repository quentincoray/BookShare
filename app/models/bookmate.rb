class Bookmate < ApplicationRecord
  belongs_to :user
  has_many :bookmate_book_categories, dependent: :destroy
  has_many :selling_books,through: :bookmate_book_categories, dependent: :destroy
  has_many :books, through: :selling_books
  has_many :orders, dependent: :destroy
  has_many :loved_bookstores, dependent: :destroy


  validates :description, presence: :true
  validates :deliver_by_hand, inclusion: { in: [ true, false ] }
  validates :home_delivery, inclusion: { in: [ true, false ] }

  def review_count
    orders.where.not(review: nil).count
  end

  def average_rating
    return if review_count == 0

    return orders.where.not(rating: nil).average(:rating).round
  end
end
