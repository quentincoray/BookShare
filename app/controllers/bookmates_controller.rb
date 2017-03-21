class BookmatesController < ApplicationController

  skip_before_action :authenticate_user!, only: :search
  skip_after_action :verify_policy_scoped, only: :search


  def search
    @address = [params[:latitude],params[:longitude]].join(",")
    @users_near_me = User.near(@address, 10)
    @bookmates_near_me = @users_near_me.map { |user| user.bookmates }.flatten
    @hash = Gmaps4rails.build_markers(@users_near_me) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: 'infowindow', locals: { user: user })
    end
    # @bookmates = User.bookmates
  end
end



    # @users = @bookmates.map { |bookmate| bookmate.user }
    # @users_near_me = @users.flatten.near(@address, 10)
