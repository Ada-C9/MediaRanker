Rails.application.routes.draw do
  get 'users/new'

  get 'users/edit'

  get 'users/show'

  get 'users/update'

  get 'users/destroy'

  get 'users/create'

  get 'users/index'

  get 'sessions/create'

  get 'sessions/new'

  get 'sessions/destroy'

  root to: 'works#top'

  get '/works/top', to: 'works#top', as: 'top_works'
  resources :works
  resources :votes
  post 'votes/:id', to: 'votes#create', as: 'votes_path'

  get 'login', to: 'users#login_form', as: 'login'
  post 'login', to: 'users#login'

  post 'logout', to: 'users#logout', as: 'logout'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
