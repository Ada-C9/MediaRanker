Rails.application.routes.draw do



  resources :works

  resources :users , only: [:new, :create, :update]




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
