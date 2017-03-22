class BookmatesController < ApplicationController

  skip_before_action :authenticate_user!, only: :search
  skip_after_action :verify_policy_scoped, only: :search
  before_action :set_bookmate, only: [:show]

  def show
    authorize @bookmate
    @count = 0
    @bookmate_book_categories = BookmateBookCategory.all

    if @bookmate.deliver_by_hand == true
      @count = @count + 1
    end

    if @bookmate.home_delivery == true
      @count = @count + 1
    end
  end

  def search
    @address = [params[:latitude],params[:longitude]].join(",")
    #récupère un array de ISBN > comparer les bookstore collections avec cet array
    # @book = [params[:author], params[:title]]
    @users_near_me = User.near(@address, 10)
    @bookmates_near_me = @users_near_me.map { |user| user.bookmates }.flatten
    @hash = Gmaps4rails.build_markers(@users_near_me) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      # marker.infowindow render_to_string(partial: 'infowindow', locals: { user: user })
    end
  end

  private

  def set_bookmate
    @bookmate = Bookmate.find(params[:id])
  end
end
