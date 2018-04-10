Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'works#index'

  resources :works

  # resources :works do
  #   resources :votes, only: [:create, :show]
  # end
  #
  # resources :votes

end
