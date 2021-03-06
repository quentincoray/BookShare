class SellingBooksController < ApplicationController
  before_action :set_selling_book, only: [:show, :liked]

  def show
    authorize @selling_book
    @order = Order.new
    @isbn = @selling_book.book.isbn
    @bookmate = @selling_book.bookmate
    @books_category = SellingBook.where(bookmate_book_category: @selling_book.bookmate_book_category)
  end

  private

  def set_selling_book
    @selling_book = SellingBook.find(params[:id])
  end
end
