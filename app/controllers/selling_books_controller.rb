class SellingBooksController < ApplicationController
  before_action :set_selling_book, only: [:show, :liked]

  def show
    authorize @selling_book
    @order = Order.new
    @isbn = @selling_book.book.isbn
    @bookmate = @selling_book.bookmate
  end

  private

  def set_selling_book
    @selling_book = SellingBook.find(params[:id])
  end
end
