Rails.application.routes.draw do


  root 'homepage#index'


  resources :works do
    resources :votes, only: [:create]
  end


  get '/login', to: 'users#new', as: 'login_form'
  get '/users', to: 'users#index', as: 'users'
  get '/user', to: 'users#show', as: 'user'
  post'/login', to: 'users#create', as: 'login'
  delete '/login', to: 'users#destroy', as: 'logout'

end
