Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  resources :users, only: [:index, :show]

  resources :works do
    post :upvote
  end

  get '/login', to: 'sessions#page'
  post '/login', to: 'sessions#login'
  delete '/logout', to: 'sessions#logout'

end
