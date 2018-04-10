Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'works#home'

  resources :works

  resources :users, only: [:index, :show]

  get '/', to: 'works#home', as: 'home'
end
