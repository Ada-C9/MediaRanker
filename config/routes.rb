Rails.application.routes.draw do

get '/login', to: 'session#new', as: 'login_form'
post '/login', to: 'session#create', as: 'login'
delete '/login', to: 'session#destroy', as: 'logout'

  root 'welcomes#index'

  resources :users

  resources :works do
    resources :votes, only: [:create]
  end

  # resources :votes

end
