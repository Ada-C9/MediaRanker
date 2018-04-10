Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "works#homepage"
  resources :works do
    resources :votes, only: [:index, :show]
  end
  resources :users
  resources :votes
  get "/homepage", to: "works#homepage", as: "homepage"
end
