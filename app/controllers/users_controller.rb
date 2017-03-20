class UsersController < ApplicationController

  private

  def user_params
    params.require(:user).permit(:name, :description, :photo)
  end
end
