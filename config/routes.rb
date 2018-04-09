Rails.application.routes.draw do
  # root 'works#index'

  resources :works do
    resources :votes
  end

  resources :users do
    resources :votes
  end

end
