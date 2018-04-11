Rails.application.routes.draw do

  resources :works
  resources :users, only: [:index, :show]

  root "main#index"
  get '/login', to: 'main#login', as: 'login_form'
  post '/login', to: 'main#create', as: 'login'
  delete '/login', to: 'main#destroy', as: 'logout'
  post 'works/:id/upvote', to: "works#upvote", as: 'upvote'

end
