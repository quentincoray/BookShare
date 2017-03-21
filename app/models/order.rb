class Order < ApplicationRecord
  belongs_to :bookmate
  belongs_to :user

  validates :order_status, inclusion: { in: ["pending","paid"], allow_nil: false }
  validates :delivery_status, { in: ["en cours","effectuée"], allow_nil: false }

  delivery_type_array = []
  if @bookmate.deliver_by_hand
    delivery_type_array << "livraison à domicile"
  end
  if @bookmate.home_delivery
    delivery_type_array << "livraison en main propre"
  end

  validates :delivery_type, { in: delivery_type_array, allow_nil: false }
  validates :rating, presence: true
  validates :review, presence: true
end
