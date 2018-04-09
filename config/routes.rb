Rails.application.routes.draw do

  root 'works#index'

  resources :works

  resources :users

  resources :votes

end
