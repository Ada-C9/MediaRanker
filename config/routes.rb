Rails.application.routes.draw do
  resources :arts

  root 'arts#index'
end
