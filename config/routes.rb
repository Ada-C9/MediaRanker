Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mains#index'
  resources :votes, only: [:create, :delete]
  resources :works do
    resources :votes, only: [:create]
  end
  resources :users

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end

# votes#index
# votes#new
# member do
#   post 'upvote'
# end
