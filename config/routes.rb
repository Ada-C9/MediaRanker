Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login_path'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'


  root 'welcomes#index'

  resources :users, only: [:index, :show]
  resources :works do
    resources :votes, only: [:create]
  end

end
