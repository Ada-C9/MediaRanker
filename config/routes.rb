Rails.application.routes.draw do

resources :works
resources :users, only: [:index, :create, :edit, :show]
resources :votes, only: [:index, :create]
end

# Add 2 patches for a user logging in/out
