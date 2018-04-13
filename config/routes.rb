Rails.application.routes.draw do
  root 'arts#index'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#login'
  post '/logout', to: 'sessions#logout', as: 'logout'

  resources :arts
  post '/arts/:id/upvote', to: 'arts#upvote', as: 'upvote'

  resources :users, only: [:index, :show]
end
