Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  root to: 'works#welcome'

  resources :works do
    resources :upvotes, only: [:create, :show, :new, :index]
  end

  resources :users, only: [:index, :show]

end
