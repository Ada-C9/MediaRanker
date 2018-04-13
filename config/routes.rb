Rails.application.routes.draw do

  root to: 'works#welcome'
  resources :works do
      resources :upvotes, :except => [:destroy, :edit, :update]
  end

  resources :users, :except => [:destroy, :edit] do
    resources :upvotes, :only => [:show, :index]
  end
  resources :upvotes, :except => [:destroy, :edit, :update]

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  # get 'works/index'
  #
  # get 'works/show'
  #
  # get 'works/new'
  #
  # get 'works/create'
  #
  # get 'works/edit'
  #
  # get 'works/update'
  #
  # get 'works/destroy'
  #
  # get 'users/index'
  #
  # get 'users/show'
  #
  # get 'users/new'
  #
  # get 'users/create'
  #
  # get 'users/edit'
  #
  # get 'users/update'
  #
  # get 'users/destroy'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
