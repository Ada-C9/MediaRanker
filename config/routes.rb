Rails.application.routes.draw do
root "main#index"
post 'works/:id/upvote', to: "works#upvote", as: 'upvote'
resources :users, only: [:index, :show]


  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy', as: 'logout'


  resources :works







end
