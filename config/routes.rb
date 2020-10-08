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
  get 'card_details',to: 'products#card_details'
  get 'order',to: 'orders#order'
  get 'logout',to: 'authentication#logout'
  get 'product_selling_detail' , to:'products#product_selling_detail'
  get 'customer_buy_detail' , to:'products#customer_buy_detail'
  post 'authenticate', to: 'authentication#authenticate'
  post 'buy_product', to: 'products#buy_product'
end
