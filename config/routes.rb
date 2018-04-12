Rails.application.routes.draw do

  root 'welcomes#index'

  resources :users, only: [:index, :show]
  resources :works do
    resources :votes, only: [:create]
  end

end
