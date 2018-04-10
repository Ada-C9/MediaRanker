Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'works#index'

  resources :works
  resources :votes
  resources :users
  get '/login', to: 'users#new', as: 'login'
  post '/login', to: 'users#create'
  delete '/logout', to: 'users#destroy', as: 'logout'
end
