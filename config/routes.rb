Rails.application.routes.draw do
  root 'works#root'

  resources :works

  # get '/signup', to:
  # post '/signup', to:

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
