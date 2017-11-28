class ApplicationController < ActionController::Base
  before_filter :authorize
  protect_from_forgery with: :exception
  before_action :set_date_loaded

  private
  def set_date_loaded
    @date_loaded = Time.now
  end

  def current_cart
    Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  protected

  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
end
