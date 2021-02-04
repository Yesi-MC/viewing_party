Rails.application.routes.draw do

  root 'welcome#index'
  resources :users, only: [:new, :create] do
    resources :dashboard, only: [:index]
  end
  resources :discover, only: [:index]
end
