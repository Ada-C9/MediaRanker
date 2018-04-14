Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  resources :votes
  resources :users

  resources :works do
    resources :votes, only: [:new, :create, :index]
  end

  # Home-page:
  root 'home#index'

  get 'home/', to: 'home#index'


end
