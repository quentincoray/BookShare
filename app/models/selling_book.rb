class SellingBook < ApplicationRecord
  belongs_to :bookmate
  belongs_to :book

  validates :personalized_comment, presence: :true
  validates :price, presence: :true
  validates :condition, presence: :true
  validates :favorite_book, inclusion: { in: [ true, false ] }
  validates :sold, inclusion: { in: [ true, false ] }
end
