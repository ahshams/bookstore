Rails.application.routes.draw do
  resources :orders
  resources :products
  resources :line_items
  resources :carts


  resources :products do
    get :who_bought, on: :member
  end

  root to: "store#index", as: 'store'
  get 'store/index'
  get 'store/contact'
  get 'store/about'
  get 'store/cancel_order'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
