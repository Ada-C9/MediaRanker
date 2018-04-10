Rails.application.routes.draw do
  root "works#index" #change this later

  resources :works

  resources :users

  resources :votes
end
