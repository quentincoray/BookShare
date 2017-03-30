class LovedBooksController < ApplicationController
  before_action :set_book, only: [:create, :destroy]

  def create
    @loved_book = LovedBook.new
    @loved_book.user = current_user
    @loved_book.book = @book
    authorize @loved_book

    if @loved_book.save
      redirect_to user_path(current_user, anchor: 'orders'), notice: "Le livre a été ajouté à vos favoris"
    else
      redirect_to user_path(current_user, anchor: 'orders'), alert: "Oops! Il y a eu un problème, veuillez réessayer"
    end
  end

  def destroy
    @loved_book = current_user.loved_books.where(book: @book).first
    authorize @loved_book

    @loved_book.destroy

    if @loved_book.destroyed?
      redirect_to user_path(current_user, anchor: 'orders'), notice: "Le livre a été retiré de vos favoris"
    else
      redirect_to user_path(current_user, anchor: 'orders'), alert: "Oops ! Il y a eu un problème, veuillez réessayer"
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
