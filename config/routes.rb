Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'main#index'

  # need to check only the ones that are used
  resources :works

  resources :users, only: [:index, :show]

  get '/login', to:'sessions#new', as:'login'
  post '/login', to:'sessions#create'

  delete '/logout', to:'sessions#destroy', as: 'logout'

  # post "work/:id/votes", to: "votes#create", as: "create_vote"
  post "/votes/:work_id", to: "votes#create", as: "create_vote"

end
