class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update]

  def show
    authorize @order
    @bookmate = @order.bookmate
    @delivery_type_array = []
    if @bookmate.deliver_by_hand
      @delivery_type_array << "livraison à domicile"
    end
    if @bookmate.home_delivery
      @delivery_type_array << "livraison en main propre"
    end
  end

  def new
    @order = Order.new
  end

  def create
    @selling_book = SellingBook.find(params[:selling_book_id])

    @order = current_user.orders.where(order_status: "pending").last
    @order ||= Order.new
    authorize @order
    @order.order_status = "pending"
    @order.bookmate = @selling_book.bookmate
    @order.delivery_status = "en cours"
    @order.delivery_type = "livraison à domicile"
    @order.user = current_user
    @order.selling_books << @selling_book
    @total = 0
    @order.selling_books.each do |selling_book|
      @total += 1
    end
    @order.save
    redirect_to bookmate_selling_book_path(@selling_book.bookmate,@selling_book), notice: 'Le livre a été ajouté au panier'
  end

  def update
    create # same behaviour
  end


  private

  def set_order
    @order = Order.find(params[:id])
  end

end

