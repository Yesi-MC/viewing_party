Rails.application.routes.draw do
  resources :dashboard, only: [:index]
  resources :discover, only: [:index]
end
