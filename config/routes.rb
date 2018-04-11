Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  # need to check only the ones that are used
  resources :works

  resources :users

  resources :votes

  get "work/:id/votes", to: "votes#create", as: "create_vote"
  post "work/:id/votes", to: "votes#create"
end
