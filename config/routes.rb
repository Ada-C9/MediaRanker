Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "works#index"
  resources :works do
    resources :votes, only: [:index, :show]
  end
  resources :users
  resources :votes
end
