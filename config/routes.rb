Rails.application.routes.draw do
  resources :users

  resources :votes

  resources :works

  root 'works#index'
end
