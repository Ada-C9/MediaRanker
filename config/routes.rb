Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'works#top'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :works do
    post '/upvote', to: 'works#upvote', as: 'upvote'
  end


  resources :users, only: [:index, :show]

  get '/:category', to: 'works#index', as: 'category'
  get '/:category/new', to: 'works#new', as: 'new_category'
end
