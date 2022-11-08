Rails.application.routes.draw do
  get 'recipes/index'
  devise_for :users
  # Defines the root path route ("/")
  root to: 'users#index'
  resources :foods, only: %i[index show new create]
  resources :recipes, only: %i[index show new create destroy]
  resources :public_recipes, only: %i[index]
end
