Rails.application.routes.draw do

  resources :works do
    resources :votes, only: [:new, :index]
    resources :users, only: [:new, :index, :show]
  end

  # resources :votes
  # resources :users

  root 'works#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
