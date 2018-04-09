Rails.application.routes.draw do
  root 'works#index'

  resources :works do
  end

end
