Rails.application.routes.draw do

  root 'mains#index'

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  resources :mains, only: [:index]

  resources :works

  resources :users, only: [:index, :show]

  resources :votes, only: [:create]

end
