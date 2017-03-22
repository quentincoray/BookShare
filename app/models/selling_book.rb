class SellingBook < ApplicationRecord
  belongs_to :book
  belongs_to :bookmate_book_category, optional: true
  has_one :bookmate, through: :bookmate_book_category
  has_one :ordered_book

  validates :personalized_comment, presence: :true
  validates :price, presence: :true
  validates :condition, presence: :true
  validates :favorite_book, inclusion: { in: [ true, false ] }
  validates :sold, inclusion: { in: [ true, false ] }
end
