Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/new'

  get 'sessions/destroy'

  root 'welcomes#index'
  
  resources :users, only: [:index, :show]
  resources :works do
    resources :votes, only: [:create]
  end

end
