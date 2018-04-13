Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  root 'welcomes#index'

  resources :users
  resources :works do
    resources :votes, only: [:create]
  end
  resources :votes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
