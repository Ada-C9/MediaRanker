Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'

  root 'welcomes#index'

  resources :users

  resources :works do
    resources :votes, only: [:create]
  end


end
