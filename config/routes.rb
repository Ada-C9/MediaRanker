Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'

  resources :works

  resources :works do
    resources :votes, only: [:create]
    resources :users, only: [:index]
  end

  resources :users, only: [:index, :show, :create]

  resources :users do
    
  end

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

end
