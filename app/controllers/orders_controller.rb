class OrdersController < ApplicationController
  before_action :set_order, only: [:show]


  def show
    authorize @order
  end

  def new
    @order = Order.new
  end

  def create
    delivery_type_array = []
    @selling_book = SellingBook.find(params[:selling_book_id])
    @order = Order.new
    @order.order_status = "pending"
    @order.bookmate = @selling_book.bookmate
    @order.user = current_user
    @order.selling_books << @selling_book
    current_user.save
    if @order.save
      redirect_to bookmate_selling_book(@selling_book.bookmate,@selling_book), notice: 'Le livre a été ajouté au panier'
    else
      render :new
    end
  end


  private

  def set_order
    @order = Order.find(params[:id])
  end

end

