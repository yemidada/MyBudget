Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  get 'logout'  => 'users#destroy' 
  resources :entities
  resources :groups
end
