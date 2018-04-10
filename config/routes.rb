Rails.application.routes.draw do
  get 'works/index'

  get 'users/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :works

  resources :users
  get '/login', to: 'users#new', as: 'login'
  post '/login', to: 'users#create'
end
