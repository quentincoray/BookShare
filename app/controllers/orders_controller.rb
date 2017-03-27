class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :delivered]

  def show
    authorize @order
    @bookmate = @order.bookmate
    @delivery_type_array = []
    if @bookmate.deliver_by_hand
      @delivery_type_array << "Livraison en main propre"
    end
    if @bookmate.home_delivery
      @delivery_type_array << "Livraison à domicile"
    end
    # @delivery_type = Order.select(:delivery_type).distinct

    @total = 0
    @order.selling_books.map do |selling_book|
      @total += selling_book.price
    end
    @total
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
    @order.save
    redirect_to bookmate_selling_book_path(@selling_book.bookmate,@selling_book), notice: 'Le livre a été ajouté au panier'
  end

  def update
    @order = current_order
    authorize @order
    @order.order_status = "paid"
    # @order.delivery_status = "en cours"
    # @order.delivery_type = "livraison à domicile"
    @order.user = current_user
    @total = 0

    @order.selling_books.map do |selling_book|
      @total += selling_book.price
    end

    @total
    @order.save
    redirect_to order_path(@order), notice: "La commande a bien été prise en compte"
  end

  def delivered
    @order.delivery_status = "effectuée"
    @order.save
  end

  def reviewed
    @order = Order.find(params[:order_id])
    authorize @order
    @user = current_user
    if @order.update(order_params)
      redirect_to user_path(@user, anchor: "orders"), notice: "Your comment is saved!"
    else
      redirect_to user_path(@user, anchor: "orders"), alert: "Oops! There was a problem, please try again"
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:review, :rating)
  end

end




