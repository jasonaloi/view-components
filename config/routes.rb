Rails.application.routes.draw do
  resources :view_components

  root 'view_components#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
