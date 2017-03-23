class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @paid_orders = Order.all.where(@order_status: "paid" )
    @user = User.find(params[:id])
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
