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


  # def average_rating
  #   @mean = 0





  #   @bookmate_orders = Order.all.where(:bookmate @bookmate)
  #   @mean = 0
  #   @bookmate_orders.each do |bookmate_order|
  #     @sum += bookmate_order.rating
  #   end
  #   if @bookmate_orders.count > 0
  #     @mean = @sum.fdiv(@bookmate_orders.count)
  #   else
  #     @mean = ""
  #   end
  #   @nb = @bookmate_orders.count
  # end

end
