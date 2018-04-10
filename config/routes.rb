Rails.application.routes.draw do
  get 'votes/index'

  get 'votes/new'

  get 'votes/create'

  get 'votes/show'

  get 'votes/update'

  get 'votes/edit'

  get 'votes/destroy'

  get 'users/index'

  get 'users/new'

  get 'users/create'

  get 'users/show'

  get 'users/update'

  get 'users/edit'

  get 'users/destroy'

  root 'main#index'

  resources :works do

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
