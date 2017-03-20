class BooksController < ApplicationController
  before_action :set_book, only: [:show]

  def show
    authorize @book
  end

  private

  def set_book
    @book = Bookm.find(params[:id])
  end
end
