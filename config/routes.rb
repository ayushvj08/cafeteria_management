Rails.application.routes.draw do
  resources :menu_items
  resources :menu_categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users

  get "/" => "home#index"
  get "/cafe" => "cafe#index"
  get "/cafe/checkout" => "cafe#checkout"

  post "/cart/new" => "shopping_cart#create"
  post "/delete_cart_item" => "shopping_cart#destroy"

  get "/order" => "order_items#index"
  post "/order/items" => "order_items#create"
  get "/order/view" => "order_items#show"
  put "/order/update" => "order_items#update"
  get "/order/filter" => "order_items#filter"
  post "/order/filter" => "order_items#filter_order"

  get "/signin", to: "sessions#new", as: :new_sessions
  post "/signin", to: "sessions#create", as: :sessions
  delete "/signout", to: "sessions#destroy", as: :destroy_session
end
