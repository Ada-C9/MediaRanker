Rails.application.routes.draw do
  get 'works/index'

  get 'users/index'

  root 'votes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :works

  resources :votes, only: [:index, :new, :create]

  resources :users
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
