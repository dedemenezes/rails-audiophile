Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/category/:id', to: 'categories#show', as: :category

  resources :categories, only: %i[index show create] do
    resources :products, only: :show
  end
  resources :cart_products, only: %i[create destroy]
  # delete '/cart_products/:id', to: 'cart_products#destroy', as: 'delete_cart_product'
  resources :carts, only: :show
end
