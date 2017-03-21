class BookmateBookCategory < ApplicationRecord
  has_many :selling_books
  belongs_to :bookmate
end
