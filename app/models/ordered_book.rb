class OrderedBook < ApplicationRecord
  belongs_to :order
  belongs_to :selling_book
end
