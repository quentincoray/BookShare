class SellingBooksController < ApplicationController
  before_action :set_selling_book, only: [:show]

  def show
    authorize @selling_book
  end

  private

  def set_selling_book
    @selling_book = SellingBook.find(params[:id])
  end
end
