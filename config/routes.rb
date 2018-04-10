Rails.application.routes.draw do
  get 'works/index'

  get 'works/new'

  get 'works/create'

  get 'works/show'

  get 'works/edit'

  get 'works/update'

  get 'works/destroy'

  get 'main/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
