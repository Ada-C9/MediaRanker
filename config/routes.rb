Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "works#homepage"
  resources :works
  resources :users
  get "/works/:work_id/upvote", to: "votes#upvote", as: "upvote"
  # resources :votes
  get "/homepage", to: "works#homepage", as: "homepage"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#login"
  delete "/logout", to: "sessions#logout", as: "logout"
end
