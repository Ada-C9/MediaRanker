Rails.application.routes.draw do
  root 'welcomes#index'

  resources :user
  resources :works
  resources :votes

  #       Prefix Verb URI Pattern          Controller#Action
  #   votes_index GET  /votes/index(.:format)   votes#index
  #     votes_new GET  /votes/new(.:format)     votes#new
  #  votes_create GET  /votes/create(.:format)  votes#create
  #    votes_show GET  /votes/show(.:format)    votes#show
  #  votes_update GET  /votes/update(.:format)  votes#update
  # votes_destroy GET  /votes/destroy(.:format) votes#destroy
  #    votes_edit GET  /votes/edit(.:format)    votes#edit
  #   works_index GET  /works/index(.:format)   works#index
  #     works_new GET  /works/new(.:format)     works#new
  #  works_create GET  /works/create(.:format)  works#create
  #    works_show GET  /works/show(.:format)    works#show
  #  works_update GET  /works/update(.:format)  works#update
  # works_destroy GET  /works/destroy(.:format) works#destroy
  #    works_edit GET  /works/edit(.:format)    works#edit
  #   users_index GET  /users/index(.:format)   users#index
  #     users_new GET  /users/new(.:format)     users#new
  #  users_create GET  /users/create(.:format)  users#create
  #    users_show GET  /users/show(.:format)    users#show
  #  users_update GET  /users/update(.:format)  users#update
  # users_destroy GET  /users/destroy(.:format) users#destroy
  #    users_edit GET  /users/edit(.:format)    users#edit
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
