class SellingBooksController < ApplicationController
  before_action :set_selling_book, only: [:show, :liked]

  def show
    authorize @selling_book
    @order = Order.new
    @isbn = @selling_book.book.isbn
    @bookmate = @selling_book.bookmate
  end

  def liked
    @loved_book = LovedBook.new
    @loved_book.user = current_user
    @order = Order.find(params[:order_id])
    # @selling_book = @order.SellingBook.find(params[:selling_book_id])
    @book = @selling_book.book
    @loved_book.book = @book

    if @loved_book.save
        redirect_to user_path(@user), alert: "le livre a été liké"
    else
        redirect_to user_path(@user), alert: "Oops! There was a problem, please try again"
    end
  end

  private

  def set_selling_book
    @selling_book = SellingBook.find(params[:id])
  end


  private

  def loved_book_params
    params.require(:loved_book).permit(:user, :book)
  end

end
