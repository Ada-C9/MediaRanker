Rails.application.routes.draw do


  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  root to: 'works#welcome'

  resources :works do
    resources :upvotes, only: [:create]
  end

  resources :users, only: [:index, :show]
  #
  # resources :works do
  #   resources :upvotes, :except => [:destroy, :edit, :update]
  # end
  #
  # resources :users, :except => [:destroy, :edit] do
  #   resources :upvotes, :only => [:show, :index]
  # end
  #
  # resources :upvotes, :except => [:destroy, :edit, :update]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
