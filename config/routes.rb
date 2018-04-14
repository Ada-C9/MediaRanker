# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do

  root 'works#main'

  resources :works do
    resources :votes, only: [:create]
  end

  # TODO Write this nested route - if you are not logged in you cannot Upvote
  get '/works/:work_id/upvote', to: 'votes#create', as: 'upvote'

  resources :users

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
