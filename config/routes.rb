Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'homes#index'

  resources :works do
    resources :votes, only: [:create]
  end


  resources :users, only: [:index, :show, :create]
end
