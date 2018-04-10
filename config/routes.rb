Rails.application.routes.draw do

  root "works#main"

  resources :works

  resources :users

  resources :votes
end
