Rails.application.routes.draw do
  root 'works#root'

  resources :works
  resources :users, only: [:show, :index]

  # get '/signup', to:
  # post '/signup', to:

  post '//works/:id/upvote', to: 'works#upvote', as: :upvote

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
