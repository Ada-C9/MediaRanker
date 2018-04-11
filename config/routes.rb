Rails.application.routes.draw do

  root 'welcomes#index'

  resources :users

  resources :works do
    resources :votes, only: [:create]
  end


end
