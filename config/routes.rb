Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'works#home'

  resources :works do
    resources :votes, only: [:create]
  end

  resources :users, only: [:index, :show]

  resources :votes, only: [:create]

  get '/', to: 'works#home', as: 'home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
