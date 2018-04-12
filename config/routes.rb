Rails.application.routes.draw do

  root 'homepage#index'
  get '/works/new', to: 'works#new', as:'new_work'
  post '/works', to:'works#create', as: 'works'
  get '/works', to: 'works#index'
  get '/works/:id', to:'works#show', as: 'work'
  get '/works/:id/edit', to:'works#edit', as:'edit_work'
  delete '/works/:id', to: 'works#destroy', as:'delete_work'
  patch '/works/:id', to:'works#update'

  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show', as: 'user'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
