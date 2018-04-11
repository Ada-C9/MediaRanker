Rails.application.routes.draw do

  root 'welcome#index'

  resources :works do
    resources :votes
  end

  resources :users, except: [:edit, :update, :destroy] do
    resources :votes
  end

end
