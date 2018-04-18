Rails.application.routes.draw do
  get '/login', to: 'sessions#new', as: 'login_form'

  post '/login', to: 'sessions#create', as: 'login'

  delete '/login', to: 'sessions#destroy', as: 'logout'

  get 'upvotes/index'

  # post '/upvotes', to: 'upvotes#create', as: 'upvote'

  resources :works do
    resources :upvotes, only: [:create]
  end

  resources :users, except: [:edit, :update, :new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'upvotes#index'
end
