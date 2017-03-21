class BookmatesController < ApplicationController
  before_action :set_bookmate, only: [:show]

  def show
    authorize @bookmate
    @book = book
  end

  private

  def set_bookmate
    @bookmate = Bookmate.find(params[:id])
  end
end
