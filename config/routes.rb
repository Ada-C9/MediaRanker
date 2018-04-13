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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
