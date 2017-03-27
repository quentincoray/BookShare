class Order < ApplicationRecord
  DELIVERY_STATUS = ["en cours","effectuée"]
  DELIVERY_TYPE = ["livraison à domicile", "livraison en main propre"]

  belongs_to :bookmate
  belongs_to :user
  has_many :ordered_books
  has_many :selling_books, through: :ordered_books

  validates :order_status, inclusion: { in: ["pending","paid"], allow_nil: false }
  validates :delivery_status, inclusion: { in: ["en cours","effectuée"], allow_nil: false }
  validates :delivery_type, inclusion: { in: ["livraison à domicile","livraison en main propre"], allow_nil: false }
end
