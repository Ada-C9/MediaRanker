Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'mainpage#index'
  
  get '/books', to: 'works#index', as: 'books'
  resources :works do
    post '/upvote', to: 'works#upvote', as: 'upvote'
  end

  resources :users, only: [:index, :show]
end
