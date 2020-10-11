Rails.application.routes.draw do
  resources :paytm_details
  resources :card_details
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
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'caller_login',to: 'users#caller_login'
  get 'customer_payment_page',to: 'orders#customer_payment_page'
  get 'product_selling',to: 'products#product_selling'
  get 'single_product_detail',to: 'products#single_product_detail'
  get 'card_details',to: 'products#card_details'
  get 'order',to: 'orders#order'
  get 'search_customer',to: 'customers#search_customer'
  get 'logout',to: 'authentication#logout'
  get 'product_selling_detail' , to:'products#product_selling_detail'
  get 'customer_buy_detail' , to:'products#customer_buy_detail'
  get 'logout' , to:'authentication#logout'
  get 'payment_acknowledgement' , to:'orders#payment_acknowledgement'
  post 'update_order_status' , to:'products#update_order_status'
  post 'authenticate', to: 'authentication#authenticate'
  post 'buy_product', to: 'products#buy_product'
  post 'search_by_phone', to: 'customers#search_by_phone'
  post 'edit_customer_detail', to: 'customers#edit_customer_detail'
  post 'payment', to: 'orders#payment'
end
