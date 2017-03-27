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

    # @bookmate_orders = @bookmate.orders

    # @mean = 0
    # @bookmate_orders.each do |bookmate_order|
      # @sum += bookmate_order.rating
    # end
    # if @bookmate_orders.count > 0
      # @mean = @sum.fdiv(@bookmate_orders.count)
    # else
      # @mean = ""
    # end
    # @nb = @bookmate_orders.count

    @address = [params[:latitude],params[:longitude]].join(",")
    @isbn = params[:isbn]
    #récupère un array de ISBN > comparer les bookstore collections avec cet array
    @users_near_me = User.near(@address, 10)
    # @bookmates_near_me = @users_near_me.map { |user| user.bookmates }.flatten
    @bookmates_near_me = Bookmate.where(user_id: @users_near_me.map(&:id))
    @bookmates_matching = @bookmates_near_me.
      select("bookmates.*, COUNT(books.id) AS common_books").
      joins(:books).
      where(books: { isbn: @isbn }).
      group("bookmates.id")

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
