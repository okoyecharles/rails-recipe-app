Rails.application.routes.draw do
  devise_for :users, sign_out_via: %i[get post]
  # Defines the root path route ("/")
  root to: 'users#index'
  resources :foods, only: %i[index show new create]
  resources :recipes, only: %i[index show new create destroy]
  resources :public_recipes, only: %i[index]
end
