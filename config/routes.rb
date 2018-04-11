Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#landingpage'

  get '/landingpage', to: 'home#landingpage', as: 'landingpage'



  resources :home

  resources :instagrams

  resources :twitters

  resources :subreddits

  resources :users

  resources :votes

end
