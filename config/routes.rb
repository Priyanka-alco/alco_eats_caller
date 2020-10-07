Rails.application.routes.draw do
  resources :order_details
  resources :orders
  resources :discounts_products
  resources :discounts
  resources :cities
  resources :states
  resources :countries
  resources :product_details
  resources :products
  resources :customers
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'caller_login',to: 'users#caller_login'
  get 'product_selling',to: 'products#product_selling'
  post 'authenticate', to: 'authentication#authenticate'
end
