Rails.application.routes.draw do

  root 'welcomes#index'

  resources :users
  resources :works
  resources :votes

end
