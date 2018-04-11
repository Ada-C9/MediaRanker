Rails.application.routes.draw do

  root 'homepage#index'

  resources :homepage, only: [:index]

  resources :publications

  resources :users, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
