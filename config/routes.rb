Rails.application.routes.draw do
  devise_for :users
  # Defines the root path route ("/")
  root to: 'users#index'
  resources :foods, only: %i[index show new create]
  resources :recipes, only: %i[index show new create destroy]
end
