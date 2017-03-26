class LovedBooksController < ApplicationController

  def index
    @loved_books = LovedBook.all
  end
  def create
    @loved_book = LovedBook.new
    @loved_book.user = current_user
    @order = Order.find(params[:order_id])
    @selling_book = @order.SellingBook.find(params[:selling_book_id])
    @book = @selling_book.book
    @loved_book.book = @book
    @loved_book.save
  end

  private

  def loved_book_params
    params.require(:loved_book).permit(:user, :book)
  end

end
