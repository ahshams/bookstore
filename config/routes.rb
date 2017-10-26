Rails.application.routes.draw do
  resources :products
  resources :line_items
  resources :carts
  #get 'store/index'
  #get 'store/contact'

  #resources :store

  root to: "store#index", as: 'store'
  get 'store/index'
  get 'store/contact'
  get 'store/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
