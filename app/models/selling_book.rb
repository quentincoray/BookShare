class SellingBook < ApplicationRecord
  belongs_to :bookmate
  belongs_to :book
end
