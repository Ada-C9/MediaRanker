Rails.application.routes.draw do

  root 'mainpage#index'

  resources :works
  post '/works/:id/upvote', to: 'works#upvote', as: 'upvote'

  resources :users , only: [:index, :new, :create, :show]

  get '/login', to: 'sessions#login', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout' , to: 'sessions#logout', as: 'logout'






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
