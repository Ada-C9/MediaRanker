Rails.application.routes.draw do
  resources :votes
  resources :users
  resources :publications

  root 'mains#index', as: 'main'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
