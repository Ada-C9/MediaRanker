Rails.application.routes.draw do
  root 'homepage#index'

  post 'works/:id/upvote', to:"works#upvote", as: 'upvote'

  resources :works
  resources :users, only: [:index, :show] # :create & new are not needed since a new user can be created in the console, therefore it can be creates in session
  resources :votes, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
