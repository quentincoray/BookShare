class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update]

  def show
    authorize @order
  end

  def new
    @order = Order.new
  end

  def create
    delivery_type_array = []
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
    @order.save
    redirect_to bookmate_selling_book_path(@selling_book.bookmate,@selling_book), notice: 'Le livre a été ajouté au panier'
  end

  def update
  end


  private

  def set_order
    @order = Order.find(params[:id])
  end

end

