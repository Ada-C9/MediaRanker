Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'mains#index'
  resources :users
  resources :votes
  resources :works do
    resources :votes, only: [:create]
  end


  get "/works/:work_id/upvote", to: "votes#create", as: "upvote"
  
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
