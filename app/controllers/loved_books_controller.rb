class LovedBooksController < ApplicationController

  def index
    @loved_books = LovedBook.all
  end


end
