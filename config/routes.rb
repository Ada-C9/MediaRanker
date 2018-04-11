Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'

  resources :works do
    resources :votes, only: [:create]
  end


  resources :users, only: [:index, :show, :create]

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'

end

# Prefix Verb   URI Pattern                     Controller#Action
#       root GET    /                               homes#index
# work_votes POST   /works/:work_id/votes(.:format) votes#create
#      works GET    /works(.:format)                works#index
#            POST   /works(.:format)                works#create
#   new_work GET    /works/new(.:format)            works#new
#  edit_work GET    /works/:id/edit(.:format)       works#edit
#       work GET    /works/:id(.:format)            works#show
#            PATCH  /works/:id(.:format)            works#update
#            PUT    /works/:id(.:format)            works#update
#            DELETE /works/:id(.:format)            works#destroy
#      users GET    /users(.:format)                users#index
#            POST   /users(.:format)                users#create
#       user GET    /users/:id(.:format)            users#show
