Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  resources :works

  resources :users

  resources :votes

  resources :sessions, only: [:new, :create, :destoy]
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout', as: 'logout'
end
