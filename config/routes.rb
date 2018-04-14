Rails.application.routes.draw do

  get 'sessions/create'
  get 'sessions/new'

  get '/login', to: 'sessions#new', as: 'login_form'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/login', to: 'sessions#destroy', as: 'logout'

  resources :works do
    resources :votes, only: [:new, :index, :create]
  end

  resources :votes, except: [:destroy, :update, :show, :edit]
  resources :users

  root 'homepage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
