Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/category/:id', to: 'categories#show', as: :category

  resources :categories, only: %i[index show create] do
    resources :products, only: :show
  end
  resources :cart_products, only: %i[create destroy] do
    member do
      get "store_on_cookies"
    end
  end
  # delete '/cart_products/:id', to: 'cart_products#destroy', as: 'delete_cart_product'
  resources :carts, only: :show
  resources :orders, only: %i[show create] do
    resources :payments, only: :new
  end

  get '/delivery_map', to: 'pages#geocode_address', as: :delivery_map
end
