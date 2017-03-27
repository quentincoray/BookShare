class LovedBookstoresController < ApplicationController
  before_action :set_bookstore, only: [:create, :destroy]

  def create
    @loved_bookstore = LovedBookstore.new
    @loved_bookstore.user = current_user
    @loved_bookstore.bookmate = @bookmate
    authorize @loved_bookstore

    if @loved_bookstore.save
      redirect_to bookmate_path(@bookmate), notice: "le bookmate a été bookmarké"
    else
      redirect_to bookmate_path(@bookmate), alert: "Oops! Il y a eu un problème, ressayez svp"
    end
  end

  def destroy
    @loved_bookstore = current_user.loved_bookstores.where(bookmate: @bookmate).first
    authorize @loved_bookstore

    @loved_bookstore.destroy

    if @loved_bookstore.destroyed?
      redirect_to bookmate_path(@bookmate), notice: "le bookmate a été débookmarké"
    else
      redirect_to bookmate_path(@bookmate), alert: "Oops! Il y a eu un problème, ressayez svp"
    end
  end

  private

  def set_bookstore
    @bookmate = Bookmate.find(params[:bookmate_id])
  end
end
