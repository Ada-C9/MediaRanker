Rails.application.routes.draw do

  get '/login', to: 'sessions#login_form', as: 'login'

  post '/login', to: 'sessions#login'

  post '/logout', to: 'sessions#logout'

  root 'homepage#index'

  post 'works/:id/upvote', to:"works#upvote", as: 'upvote'

  resources :works
  resources :users, only: [:index, :show] # :create & new are not needed since a new user can be created in the console, therefore it can be creates in session
  resources :votes, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
