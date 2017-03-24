class BookmateBookCategory < ApplicationRecord
  has_many :selling_books
  has_many :books, through: :selling_books
  belongs_to :bookmate
end
