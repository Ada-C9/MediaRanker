Rails.application.routes.draw do

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  root to: 'works#welcome'

  resources :works do
    resources :upvotes, only: [:create]
  end

  resources :users, only: [:index, :show]

end
