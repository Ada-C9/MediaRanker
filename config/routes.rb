Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'



  resources :works do
    resources :votes, only: [:new, :create]
  end

  resources :users

  resources :votes, except: [:new, :create]

  root 'votes#index'

end
