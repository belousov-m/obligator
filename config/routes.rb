Rails.application.routes.draw do
  root to: 'bonds#index'

  resources :bonds
end
