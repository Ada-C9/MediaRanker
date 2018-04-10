Rails.application.routes.draw do
  get 'subreddits/index'

  get 'twitters/index'

  get 'instagrams/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :instagrams

  resources :twitters

  resources :subreddits 

end
