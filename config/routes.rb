Rails.application.routes.draw do
  
    root to: 'works#index'
    resources :works

  # get 'works/index'
  #
  # get 'works/show'
  #
  # get 'works/new'
  #
  # get 'works/create'
  #
  # get 'works/edit'
  #
  # get 'works/update'
  #
  # get 'works/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
