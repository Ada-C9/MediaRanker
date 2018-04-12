Rails.application.routes.draw do
  # root 'works#index'
  root 'works#main'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :works

  resources :users

end
