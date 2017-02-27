Rails.application.routes.draw do
  get 'store/index'
  get 'store/contact'

  #resources :store

  root to: "store#index", as: 'Store'
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
