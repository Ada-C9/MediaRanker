Rails.application.routes.draw do
  resources :users

  resources :votes

  resources :works

  root 'works#home'
end
