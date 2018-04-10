Rails.application.routes.draw do

  root 'mainpage#index'

  resources :works

  resources :users , only: [:index, :new, :create, :update]

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
