Rails.application.routes.draw do

  root "works#main"

  resources :works

  resources :users

  resources :votes

  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: "logout"
end
