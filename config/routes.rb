Rails.application.routes.draw do
  resources :works
  root "main#index"
end
