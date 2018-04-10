Rails.application.routes.draw do




  get '/works/new', to: 'works#new', as:'new_work'
    post '/works', to:'works#create', as: 'works'
  get '/works', to: 'works#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
