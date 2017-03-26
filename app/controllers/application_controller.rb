class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :set_basket_count, if: :user_signed_in?

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:search, :index], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:search, :index], unless: :skip_pundit?

  helper_method :current_order

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  protected

  def current_order
    return unless user_signed_in?

    @order = current_user.orders.where(order_status: "pending").last
    @order ||= Order.new
  end

  private

  def set_basket_count
    @basket_counter ||= current_order.ordered_books.count
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
