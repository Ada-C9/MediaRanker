Rails.application.routes.draw do

resources :users, only: [:index, :create, :edit, :show]
resources :works, only: [:index, :create, :show]
resources :votes, only: [:index, :create]
end

# Add 2 patches for a user logging in/out
