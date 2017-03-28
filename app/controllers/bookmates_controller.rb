class BookmatesController < ApplicationController

  skip_before_action :authenticate_user!, only: :search
  skip_after_action :verify_policy_scoped, only: [:search]
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

    if user_signed_in?
      loved_book_isbns = current_user.books.pluck(:isbn)

      # Add selected books to user loved books
      if @isbn.present?
        current_user.save_loved_books(@isbn)
      end

      # Include loved books to bookmate search
      @isbn += loved_book_isbns
    else
      session[:isbn_to_love] = @isbn
    end

    #recupere un array de ISBN > comparer les bookstore collections avec cet array
    @users_near_me = User.near(@address, 10)
    # @bookmates_near_me = @users_near_me.map { |user| user.bookmates }.flatten
    @bookmates_near_me = Bookmate.where(user_id: @users_near_me.map(&:id))

    @bookmates_matching = @bookmates_near_me.
      select("bookmates.*, COUNT(books.id) AS common_books").
      joins(:books).
      where(books: { isbn: @isbn }).
      group("bookmates.id").
      order("common_books DESC")


    # FIXME
    # @bookmates_selected.each do |bookmate|
    #   @common_books = Book.where(books: { isbn: @isbn }).size
    # end
    # duplicates = @bookmates_selected.detect { |element| @bookmates_selected.count(element) > 1 }
    # if duplicates != 0
    #   @bookmates_selected = duplicates.first
    # end

    # raise
    # @common_books = @bookmates_selected.map { |book| Book.where(books: { isbn: @isbn }) }
    # @common_books = Book.where(books: { isbn: @isbn })
    # @intersection = @isbn & @common_books
    # raise
    if @bookmates_matching.exists?
      @bookmates_selected = @bookmates_matching
    else
      @bookmates_selected = @bookmates_near_me
    end

    @hash = Gmaps4rails.build_markers(@bookmates_selected) do |bookmate, marker|
      marker.lat bookmate.user.latitude
      marker.lng bookmate.user.longitude
      marker.infowindow render_to_string(partial: 'infowindow', locals: { bookmate: bookmate })
    end
    #   @hash = Gmaps4rails.build_markers(@bookmates_selected) do |bookmate, marker|
    #     marker.lat bookmate.user.latitude
    #     marker.lng bookmate.user.longitude
    #     marker.infowindow render_to_string(partial: 'infowindow', locals: { bookmate: bookmate })
    #   end
    # end
  end




  private

  def set_bookmate
    @bookmate = Bookmate.find(params[:id])
  end


  private

  def loved_bookstore_params
    params.require(:loved_bookstore).permit(:user, :bookmate)

  end
end

#if intersection.empty?
#ordering search > people with matches come first, then closest to me
