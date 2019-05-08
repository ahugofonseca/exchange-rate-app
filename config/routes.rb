Rails.application.routes.draw do
  root to: 'rates#index'

  resources :rates, only: %i(index)
end
