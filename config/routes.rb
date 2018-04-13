Rails.application.routes.draw do
  root 'works#root'

  resources :works
  resources :users, only: [:show, :index]

  # get '/signup', to:
  # post '/signup', to:

  post '/works/:id/upvote', to: 'works#upvote', as: :upvote

  get '/login', to: 'sessions#new', as: :login
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout', as: :logout

  get '/books', to: 'works#index', as: :books
  get '/albums', to: 'works#index', as: :albums
  get '/movies', to: 'works#index', as: :movies

  get '/books/new', to: 'works#new', as: :new_book
  get '/albums/new', to: 'works#new', as: :new_album
  get '/movies/new', to: 'works#new', as: :new_movie

  post '/books/new', to: 'works#create'
  post '/albums/new', to: 'works#create'
  post '/movies/new', to: 'works#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
