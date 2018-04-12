Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'works#top_media'

  resources :works
  get '/', to: 'works#top_media', as: 'top_media'

  # resources :works do
  #   resources :votes, only: [:create, :show]
  # end
  #
  resources :users

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'


end
