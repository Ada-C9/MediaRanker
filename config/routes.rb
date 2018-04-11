Rails.application.routes.draw do

  root 'pages#index'

  resources :works

  resources :users, only: [:new, :index, :show, :create]

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
