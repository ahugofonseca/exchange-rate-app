Rails.application.routes.draw do
  root to: 'rates#index'

  resources :rates
end
