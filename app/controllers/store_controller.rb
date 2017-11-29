class StoreController < ApplicationController
  skip_before_action :authorize

  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @cart = current_cart
      @count = increment_count
    end
  end


  def increment_count
    session[:counter] ||= 0
    session[:counter] += 1
  end

  def cancel_order
    redirect_to store_url, notice: "Your have cancelled your order"
  end
end
