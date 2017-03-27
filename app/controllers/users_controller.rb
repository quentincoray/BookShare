class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @paid_orders = Order.all.where(order_status: "paid").where(user: current_user).order("created_at DESC")
    @undelivered_orders = Order.all.where(order_status: "paid").where(delivery_status: "en cours").where(user: current_user)
    @delivered_orders = Order.all.where(order_status: "paid").where(delivery_status: "effectuée").where(user: current_user).order("created_at DESC")
    @commented_orders = Order.all.where.not(review: nil).where(user: current_user)
    @uncommented_orders = Order.all.where(review: nil).where(user: current_user)
    @user = User.find(params[:id])
    @loved_books = LovedBook.all.where(user: current_user)
    @loved_bookstores = LovedBookstore.all.where(user: current_user)
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = current_user
    current_user.update(user_params)
    current_user.save
    authorize @user
    redirect_to user_path(current_user)
  end


  private

  def user_params
    params.require(:user).permit(:name, :description, :photo)
  end
end
