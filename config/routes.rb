Rails.application.routes.draw do

  root 'welcome#index'

  resources :works do
    member do
      post 'upvote'
    end
  end

  resources :users, only: [:index, :show] do
    resources :votes, only: [:index, :show, :create, :new]
  end

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout', as: 'logout'

end
