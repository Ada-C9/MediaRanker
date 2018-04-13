Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'votes#index'
  resources :works

  post '/works/[:id]/upvote', to:'votes#upvote', as: 'new_vote'

  get '/votes', to: 'votes#index', as: 'votes'

  resources :users


  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
