Rails.application.routes.draw do

  root to: 'works#welcome'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#update', as: 'logout'
  post '/logout', to: 'sessions#logout'

  resources :works do
    resources :upvotes, only: [:create, :new]
  end

  resources :users, only: [:index, :show]

end
