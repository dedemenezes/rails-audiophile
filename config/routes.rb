Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/category/:id', to: 'categories#show', as: :category
  
  resources :categories, only: %i[index show]
  resources :products, only: :show
  resources :carts, only: :show
  resources :cart_products, only: %i[create]
end
