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

    @order = Order.new(order_params)
    @order.order_status = "pending"
    @order.bookmate = @bookmate.user
    @order.user = current_user
    current_user.save
    if @order.save
      redirect_to bookmate_selling_book(@bookmate,@selling_book), notice: 'Le livre a été ajouté au panier'
    else
      render :new
    end
  end


  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:review, :rating, :delivery_type, :order_status, :delivery_status, :bookmate_id, :user_id)
  end
end

