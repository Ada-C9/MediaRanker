Rails.application.routes.draw do


  root 'main#index'
  resources :main do
    resources :main, only: [:index]
  end

  resources :works do

  end
  resources :users do

  end
  resources :votes do

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
