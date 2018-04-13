Rails.application.routes.draw do


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#landingpage'

  get '/landingpage', to: 'home#landingpage', as: 'landingpage'

#new form when you click login
  get '/login', to: 'sessions#new', as: 'login'

#associated with method of create
  post '/login', to: 'sessions#create'

#logout, or delete session
  delete '/logout', to: 'sessions#destroy'



  resources :home

  resources :instagrams do
    post '/upvote', to: 'instagrams#upvote', as: 'upvote'
  end


  resources :twitters do
    post '/upvote', to: 'twitters#upvote', as: 'upvote'
  end

  resources :subreddits do
    post '/upvote', to: 'subreddits#upvote', as: 'upvote'
  end

  resources :users do
    resources :votes, only: [:index, :new, :create]
  end



end
