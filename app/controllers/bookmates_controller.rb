class BookmatesController < ApplicationController
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

  private

  def set_bookmate
    @bookmate = Bookmate.find(params[:id])
  end
end
