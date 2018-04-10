Rails.application.routes.draw do

  get 'welcome/index'

  root 'welcome#index'

  resources :works do
    resources :votes
  end

  resources :users do
    resources :votes
  end

end
