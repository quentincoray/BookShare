class BookmatesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:search, :newcoords]
  skip_after_action :verify_authorized, only: :newcoords

  def newcoords
    @lat_lng = [params[:latitude], params[:longitude]].join(",")
  end

  def search
    @bookmates = policy_scope(Bookmate).order(created_at: :desc)
    @address = [params[:latitude],params[:longitude]].join(",")
    @users = User.near(@address, 10)
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: 'infowindow', locals: { user: user })
    end
    # @bookmates = User.bookmates
  end
end
