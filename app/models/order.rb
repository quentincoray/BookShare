class Order < ApplicationRecord
  belongs_to :bookmate
  belongs_to :user

  validates :order_status, inclusion: { in: ["pending","paid"], allow_nil: false }
  validates :delivery_status, inclusion: { in: ["en cours","effectuée"], allow_nil: false }
  validates :delivery_type, inclusion: { in: ["livraison à domicile","livraison en main propre"], allow_nil: false }
  validates :rating, presence: true
  validates :review, presence: true
end
