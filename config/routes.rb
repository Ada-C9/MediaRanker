Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "main#index"

  resources :works

  resources :users

  resources :votes
end
