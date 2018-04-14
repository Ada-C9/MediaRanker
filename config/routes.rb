Rails.application.routes.draw do
  root 'mains#index'
  resources :mains, only: [:index]

  resources :votes

  resources :works do
    resources :votes, only: [:create]
  end

  resources :users

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
