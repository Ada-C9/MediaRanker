Rails.application.routes.draw do

  root 'welcomes#index'

  resources :users

  resources :works do
    resources :votes, only: [:new, :create]
  end


end
