Rails.application.routes.draw do
  resources :menu_items
  resources :menu_categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users
  get "/user/reset_password" => "users#reset_password_form"
  post "/user/reset_password" => "users#reset_password"

  get "/" => "home#index"
  get "/cafe" => "cafe#index"
  get "/cafe/checkout" => "cafe#checkout"
  get "/cafe/cart" => "cafe#cart"

  post "/cart/new" => "shopping_cart#create"
  post "/delete_cart_item" => "shopping_cart#destroy"

  get "/order" => "order#index"

  get "/order/view" => "order#show"
  get "/order/filter" => "order#filter"
  post "/order/filter" => "order#filtered_orders"
  put "/order/update" => "order#update"

  post "/order/items" => "order_items#create"
  post "order/show" => "order_items#show"
  get "order/show" => "order_items#show"

  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
  get "/signin/forgot_password" => "sessions#forgot_password", as: :forgot_password
  post "/signin/forgot_password" => "sessions#reset_password", as: :reset_password
end
