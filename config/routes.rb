Rails.application.routes.draw do
  root 'welcomes#index'

  resources :user
  resources :works do
    resources :votes, only: [:create]
  end
  resources :votes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
