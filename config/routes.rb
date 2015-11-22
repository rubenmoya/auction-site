Rails.application.routes.draw do
  root 'products#index'

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout

  resources :users
  resources :user_sessions

  resources :products
end
