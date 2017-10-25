class ApplicationController < ActionController::Base
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
end
