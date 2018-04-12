Rails.application.routes.draw do


  root 'main#index'
  resources :main do
    resources :main, only: [:index]
  end

  resources :works do

  end
  resources :users do

  end
  resources :votes do

  end
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#logout', as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
