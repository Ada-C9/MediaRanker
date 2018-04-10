Rails.application.routes.draw do


  root 'mains#index'

  resources :mains, only: [:index]

  resources :works

  resources :users, only: [:index, :show]

end
