class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    @cart = current_cart
    @count = increment_count
  end

  def increment_count
    session[:counter] ||= 0
    session[:counter] += 1
  end

  def cancel_order
    redirect_to store_url, notice: "Your have cancelled your order"
  end
end
