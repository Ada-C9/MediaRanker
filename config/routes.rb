Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :instagrams

  resources :twitters

  resources :subreddits

  resources :users

end
