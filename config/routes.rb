Rails.application.routes.draw do

  get 'homepage/index'

  resources :votes

  resources :users

  resources :works

end
