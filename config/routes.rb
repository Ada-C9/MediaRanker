Rails.application.routes.draw do

  root 'mains#index'

  resources :mains, only: [:index]

  resources :works

end
