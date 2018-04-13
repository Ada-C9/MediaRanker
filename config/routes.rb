Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  resources :users

  resources :votes

  resources :works do
    resources :votes, only: [:new, :create, :edit, :update]
  end

  root 'works#home'
end
