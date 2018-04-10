Rails.application.routes.draw do

  get 'users/index'

  get 'users/show'

  root 'mains#index'

  resources :mains, only: [:index]

  resources :works

end
