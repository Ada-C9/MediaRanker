Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # root 'works#index'
  root 'works#main'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :works

  resources :users

end
