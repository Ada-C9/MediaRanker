Rails.application.routes.draw do

  root 'welcomes#index'

resources :works
resources :users, only: [:index, :create, :edit, :show]
resources :votes, only: [:create]
end

# Add 2 sessions for a user logging in/out
