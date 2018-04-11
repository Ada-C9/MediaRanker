Rails.application.routes.draw do
  get 'upvotes/create'

  get '/login', to: 'sessions#new', as:'login_form'
  post '/login', to: 'sessions#create', as:'login'
  delete '/login', to: 'sessions#destroy', as:'logout'

  get 'welcome/index'

  root to: 'welcome#index'
  resources :works
  resources :users, only: [:index, :show]

  resources :works do
  resources :upvotes, only: [:create]
end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
