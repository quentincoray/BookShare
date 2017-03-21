class Book < ApplicationRecord
  has_attachment :photo
  has_many :selling_books
end
