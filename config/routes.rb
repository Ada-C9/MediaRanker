Rails.application.routes.draw do

  root to: 'works#welcome'
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  patch '/logout', to: 'sessions#update', as: 'logout'

  resources :works do
    resources :upvotes, only: [:create, :show, :new, :index]
  end

  resources :users, only: [:index, :show]

end
