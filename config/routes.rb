Rails.application.routes.draw do

  resources :works

  resources :users

  resources :votes

  root 'votes#index'

end
