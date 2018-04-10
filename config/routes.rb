Rails.application.routes.draw do

  get 'votes/edit'

  get 'votes/index'

  get 'votes/new'

  get 'votes/show'

  get 'votes/create'

  get 'votes/destroy'

  get 'votes/update'

  get 'works/edit'

  get 'works/index'

  get 'works/new'

  get 'works/show'

  get 'works/create'

  get 'works/destroy'

  get 'works/update'

  get 'users/edit'

  get 'users/index'

  get 'users/new'

  get 'users/show'

  get 'users/create'

  get 'users/destroy'

  get 'users/update'

  resources :works do
    resources :votes, only: [:new, :index]
    resources :users, only: [:new, :index, :show]
  end

  # resources :votes
  # resources :users

  root 'works#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
