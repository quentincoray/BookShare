class UsersController < ApplicationController

  private

  def user_params
    params.require(:product).permit(:name, :description, :photo)
  end
end
