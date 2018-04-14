Rails.application.routes.draw do

  get 'sessions/create'
  get 'sessions/new'

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  resources :works do
    resources :votes, only: [:new, :index, :create]
    resources :users, only: [:new, :index, :show]
  end

  resources :votes
  resources :users

  root 'homepage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
