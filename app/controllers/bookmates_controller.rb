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
    @isbn = params[:isbn]
    #récupère un array de ISBN > comparer les bookstore collections avec cet array
    @users_near_me = User.near(@address, 10)
    # @bookmates_near_me = @users_near_me.map { |user| user.bookmates }.flatten
    @bookmates_near_me = Bookmate.where(user_id: @users_near_me.map(&:id))
    @bookmates_selected = @bookmates_near_me.joins(:books).where(books: { isbn: @isbn })
    @bookmates_selected.each do |bookmate|
      @common_books = Book.where(books: { isbn: @isbn }).size
    end
    # @common_books = @bookmates_selected.map { |book| Book.where(books: { isbn: @isbn }) }
    # @common_books = Book.where(books: { isbn: @isbn })
    # @intersection = @isbn & @common_books
    # raise
    if @bookmates_selected.size != 0
      @hash = Gmaps4rails.build_markers(@bookmates_selected) do |bookmate, marker|
        marker.lat bookmate.user.latitude
        marker.lng bookmate.user.longitude
        marker.infowindow render_to_string(partial: 'infowindow', locals: { bookmate: bookmate })
      end
    else
      @bookmates_selected = @bookmates_near_me
      @hash = Gmaps4rails.build_markers(@bookmates_selected) do |bookmate, marker|
        marker.lat bookmate.user.latitude
        marker.lng bookmate.user.longitude
        marker.infowindow render_to_string(partial: 'infowindow', locals: { bookmate: bookmate })
      end
    end
  end

  private

  def set_bookmate
    @bookmate = Bookmate.find(params[:id])
  end
end

#if intersection.empty?
#ordering search > people with matches come first, then closest to me
