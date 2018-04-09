Rails.application.routes.draw do


  # Works
  get 'works/', to: 'works#index', as: 'works'

  get 'works/new', to: 'works#new', as: 'new_work'

  post 'works', to: 'works#create'

  get 'works/:id/edit', to: 'works#edit', as: 'edit_work'

  get 'works/id', to: 'works#show', as: 'work'

  patch 'works/:id', to: 'works#update'

  delete 'works/:id', to: 'works#destroy'


  # Users
  get 'users/', to: 'users#index', as: 'users'

  get 'users/new', to: 'users#new', as: 'new_user'

  post 'users', to: 'users#create'

  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'

  get 'users/id', to: 'users#show', as: 'user'

  patch 'users/:id', to: 'users#update'

  delete 'users/:id', to: 'users#destroy'


  # Votes
  get 'votes/', to: 'votes#index', as: 'votes'

  get 'votes/new', to: 'votes#new', as: 'new_vote'

  post 'votes', to: 'votes#create'

  get 'votes/:id/edit', to: 'votes#edit', as: 'edit_vote'

  get 'votes/id', to: 'votes#show', as: 'vote'

  patch 'votes/:id', to: 'votes#update'

  delete 'votes/:id', to: 'votes#destroy'




end
