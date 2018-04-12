Rails.application.routes.draw do


  root 'homepage#index'


  resources :works do
    resources :votes, only: [:create]
  end


  get '/login', to: 'users#new', as: 'login_form'
  post'/login', to: 'users#create', as: 'login'
  delete '/login', to: 'users#destroy', as: 'logout'

end
