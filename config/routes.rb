Rails.application.routes.draw do
  root to: 'welcomes#index'

  resources :customers
end
