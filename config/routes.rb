Rails.application.routes.draw do

  root 'welcome#index'

  resources :works do
    resources :votes
  end

  resources :users, only: [:index, :show] do
    resources :votes
  end

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout', as: 'logout'

end
